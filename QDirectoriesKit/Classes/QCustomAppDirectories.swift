//
//  QCustomAppDirectories.swift
//  QDirectoriesKit
//
//  Created by Quinn_F on 2018/7/29.
//  Copyright © 2018年 quinn. All rights reserved.
//

import Foundation

public enum QCustomAppDirectories:Int {
    case userImage
    
    public var folderUrl: URL {
        switch self {
        case .userImage:
            return userImageFolderUrl()
        }
    }
    
    public func userImageFolderUrl() -> URL {
        let folderName: String = "userImage/"
        let url = QChildDirectories.appFile.folderUrl.appendingPathComponent(folderName)
        url.checkCreateFolder()
        return url
    }

}
