//
//  QChildDirectories.swift
//  QDirectoriesKit
//
//  Created by Quinn_F on 2018/7/29.
//  Copyright © 2018年 quinn. All rights reserved.
//

import Foundation
public enum QChildDirectories:Int {
    case tmpFile // Temporary 暂存
    case appFile // save forever, unless delete app 永久保存， 除非删掉App
    case autoHumanFile // you can custom time for file , 保存时间自定义
    
    public var folderUrl: URL {
        switch self {
        case .tmpFile:
            return tmpFileFolder()
        case .appFile:
            return appFileFolder()
        case .autoHumanFile:
            return autoHumanFolder()
        }
    }
    public func tmpFileFolder() -> URL {
        let folderName: String = "tmpFile/"
        let url = QDirectories.Tmp.sysFolderURL.appendingPathComponent(folderName)
        url.checkCreateFolder()
        return url
    }
    public func appFileFolder() -> URL {
        let folderName: String = "appFile/"
        let url = QDirectories.Document.sysFolderURL.appendingPathComponent(folderName)
        url.checkCreateFolder()
        return url
    }
    public func autoHumanFolder() -> URL {
        let folderName: String = "autoHumanFile/"
        let url = QDirectories.Document.sysFolderURL.appendingPathComponent(folderName)
        url.checkCreateFolder()
        return url
    }
    
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
}
