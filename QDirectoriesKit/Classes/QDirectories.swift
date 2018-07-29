//
//  QDirectories.swift
//  QDirectoriesKit
//
//  Created by Quinn_F on 2018/7/29.
//  Copyright © 2018年 quinn. All rights reserved.
//

import Foundation

public enum QDirectories :Int{
    
    case Document = 1
    case Library = 2
    case LibraryCache = 3
    case Tmp = 4
    case Home = 5
    
    public static let DocumentDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
                                                                 FileManager.SearchPathDomainMask.userDomainMask,
                                                                 true).first ?? (QDirectories.HomeDir + "/Docunments")
    
    public static let LibraryDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory,
                                                                FileManager.SearchPathDomainMask.userDomainMask,
                                                                true).first ?? (QDirectories.HomeDir + "/Library")
    public static let LibraryCacheDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory,
                                                                     FileManager.SearchPathDomainMask.userDomainMask,
                                                                     true).first ?? (QDirectories.HomeDir + "/Library/Cache")
    
    public static let TmpDir = NSTemporaryDirectory()
    public static let HomeDir = NSHomeDirectory()
    
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
    
}

