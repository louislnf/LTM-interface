//
//  DataSet.swift
//  LTM-interface
//
//  Created by Louis Lenief on 08/05/2018.
//  Copyright © 2018 Louis Lenief. All rights reserved.
//

import Foundation

class DataSet {
    
    // a data set is composed of samples
    
    var url: URL
    
    init(withUrl url: URL) {
        self.url = url
    }
    
    var samples: Array<Sample> {
        get {
            var s = Array<Sample>()
            let fm = FileManager.default
            do {
                let contents = try fm.contentsOfDirectory(atPath: url.path)
                for content in contents {
                    var isDirectory = ObjCBool(false)
                    let exists = fm.fileExists(atPath: url.path+"/\(content)", isDirectory: &isDirectory)
                    if exists && isDirectory.boolValue {
                        s.append(Sample(withUrl: url.appendingPathComponent(content)))
                    }
                }
            } catch {
                NSLog("DataSet: failed to load samples")
            }
        }
    }
    
}
