//
//  QFileManager.swift
//  QDirectoriesKit
//
//  Created by Quinn_F on 2018/7/29.
//  Copyright © 2018年 quinn. All rights reserved.
//

import Foundation

open class QFileManager:NSObject{
    open static let shared = QFileManager.init()
    private override init() {super.init()}
    open var maxCachePeriodInSecond: TimeInterval = 60 * 60 * 24 * 7 //Cache exists for 1 week

    open func autoDeleteFile(){
        let autpHumanFileURL = QChildDirectories.autoHumanFile.folderUrl
        deleteFilesWithURL(autpHumanFileURL)
    }
    open func deleteFilesWithURL(_ url:URL){
        let resourceKeys: Set<URLResourceKey> = [.isDirectoryKey, .contentAccessDateKey, .totalFileAllocatedSizeKey]
        let expiredDate: Date? = (maxCachePeriodInSecond < 0) ? nil : Date(timeIntervalSinceNow: -maxCachePeriodInSecond)
        let files = try? FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: Array(resourceKeys), options: .skipsHiddenFiles)
        files?.forEach { (fileUrl) in
            do {
                let resourceValues = try fileUrl.resourceValues(forKeys: resourceKeys)
                // If it is a Directory. Iterative.
                if resourceValues.isDirectory == true {
                    deleteFilesWithURL(fileUrl)
                }else{
                    if let date = resourceValues.contentAccessDate,(date as NSDate).laterDate(expiredDate!) == expiredDate{
                        try FileManager.default.removeItem(at: fileUrl)
                    }
                }
            } catch _ { }
        }
    }
    
}
