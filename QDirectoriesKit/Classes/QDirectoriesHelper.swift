//
//  QDirectoriesHelper.swift
//  QDirectoriesKit
//
//  Created by Quinn_F on 2018/7/29.
//  Copyright © 2018年 quinn. All rights reserved.
//

import Foundation

extension URL {
    func checkCreateFolder() {
        if !FileManager.default.fileExists(atPath: path) {
            try? FileManager.default.createDirectory(at: self, withIntermediateDirectories: true, attributes: nil)
        }
    }
}
extension String {
    static var uniqueString: String {
        let dataString: String = "\(Int64(Date().timeIntervalSince1970 * 1000))"
        let randomString: String = "\(arc4random_uniform(1000))"
        return dataString + randomString
    }
    static var uniqueOrderString: String {
        let dataString: String = "\(Int64(Date().timeIntervalSince1970 * 1000))"
        let staticStr: String = "QAPPFile"
        return staticStr + dataString
    }
}

