在ios中的沙盒路径的操作，用起来并非十分舒服，因此，单独写了一个沙盒路径的管理，目前包括以下内容：
#目前支持CocoaPods导入：
###pod 'QDirectoriesKit', '~> 0.1'

1.获取沙盒路径下的目录如：
```
    case Document = 1
    case Library = 2
    case LibraryCache = 3
    case Tmp = 4
    case Home = 5

    public var sysFolderURL:URL{
        switch self {
            
        case .Document:
            return URL(fileURLWithPath: QDirectories.DocumentDir, isDirectory: true)
        case .Library:
            return URL(fileURLWithPath: QDirectories.LibraryDir, isDirectory: true)
        case .LibraryCache:
            return URL(fileURLWithPath: QDirectories.LibraryCacheDir, isDirectory: true)
        case .Tmp:
            return URL(fileURLWithPath: QDirectories.TmpDir, isDirectory: true)
        case .Home:
            return URL(fileURLWithPath: QDirectories.HomeDir, isDirectory: true)
        }
        
    }
```
2.创建文件
```
    public func url(forFileName: String?) -> URL {
        let fileName = forFileName ?? "\(Date().timeIntervalSince1970)"
        return self.folderUrl.appendingPathComponent(fileName)
    }
    public func url(forRandomFilenameWithExtention ext: String) -> URL {
        let filename = "\(String.uniqueString).\(ext)"
        return url(forFileName: filename)
    }
    public func url(forTimeFilenameWithExtention ext: String) -> URL {
        let filename = "\(String.uniqueOrderString).\(ext)"
        return url(forFileName: filename)
    }
```
3.支持设置文件期限，自动清理
```
        QFileManager.shared.maxCachePeriodInSecond = 60 * 60 * 24 * 10
        QFileManager.shared.autoDeleteFile()
```

用法如下：
```
        QFileManager.shared.maxCachePeriodInSecond = 60 * 60 * 24 * 10
        QFileManager.shared.autoDeleteFile()
        
        print(#line,QChildDirectories.appFile.folderUrl)
        print(#line,QChildDirectories.appFile.appFileFolder())
        print(#line,QChildDirectories.tmpFile.folderUrl)
        print(#line,QChildDirectories.tmpFile.url(forFileName: "name.jpg"))
        print(#line,QChildDirectories.appFile.url(forTimeFilenameWithExtention: "jpg"))
        print(#line,QChildDirectories.appFile.url(forRandomFilenameWithExtention: "jpg"))
        print(#line,QCustomAppDirectories.userImage.folderUrl)
        print(#line,QDirectories.DocumentDir)
        print(#line,QChildDirectories.autoHumanFile.folderUrl)

```

log 信息：

```
20 file:///Users/xoxo_x/Library/Developer/CoreSimulator/Devices/799C46C4-3B5A-4B3D-AAD1-5B6015D715D4/data/Containers/Data/Application/473AE002-CC18-495A-B109-37E1B24F84A2/Documents/appFile
21 file:///Users/xoxo_x/Library/Developer/CoreSimulator/Devices/799C46C4-3B5A-4B3D-AAD1-5B6015D715D4/data/Containers/Data/Application/473AE002-CC18-495A-B109-37E1B24F84A2/Documents/appFile
22 file:///Users/xoxo_x/Library/Developer/CoreSimulator/Devices/799C46C4-3B5A-4B3D-AAD1-5B6015D715D4/data/Containers/Data/Application/473AE002-CC18-495A-B109-37E1B24F84A2/tmp/tmpFile
23 file:///Users/xoxo_x/Library/Developer/CoreSimulator/Devices/799C46C4-3B5A-4B3D-AAD1-5B6015D715D4/data/Containers/Data/Application/473AE002-CC18-495A-B109-37E1B24F84A2/tmp/tmpFile/name.jpg
24 file:///Users/xoxo_x/Library/Developer/CoreSimulator/Devices/799C46C4-3B5A-4B3D-AAD1-5B6015D715D4/data/Containers/Data/Application/473AE002-CC18-495A-B109-37E1B24F84A2/Documents/appFile/QAPPFile1532852195193.jpg
25 file:///Users/xoxo_x/Library/Developer/CoreSimulator/Devices/799C46C4-3B5A-4B3D-AAD1-5B6015D715D4/data/Containers/Data/Application/473AE002-CC18-495A-B109-37E1B24F84A2/Documents/appFile/1532852195195238.jpg
26 file:///Users/xoxo_x/Library/Developer/CoreSimulator/Devices/799C46C4-3B5A-4B3D-AAD1-5B6015D715D4/data/Containers/Data/Application/473AE002-CC18-495A-B109-37E1B24F84A2/Documents/appFile/userImage
27 /Users/xoxo_x/Library/Developer/CoreSimulator/Devices/799C46C4-3B5A-4B3D-AAD1-5B6015D715D4/data/Containers/Data/Application/473AE002-CC18-495A-B109-37E1B24F84A2/Documents
28 file:///Users/xoxo_x/Library/Developer/CoreSimulator/Devices/799C46C4-3B5A-4B3D-AAD1-5B6015D715D4/data/Containers/Data/Application/473AE002-CC18-495A-B109-37E1B24F84A2/Documents/autoHumanFile

```

####如果发现bug、请私信、欢迎Star
