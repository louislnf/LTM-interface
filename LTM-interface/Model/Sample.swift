//
//  Sample.swift
//  LTM-interface
//
//  Created by Louis Lenief on 08/05/2018.
//  Copyright © 2018 Louis Lenief. All rights reserved.
//

import Foundation

class Sample {
    
    let allowedVideoFormats = ["mp4", "avi"]
    
    var url: URL
    var videos: Array<Video> {
        get {
            var v = Array<Video>()
            let fm = FileManager.default
            do {
                let contents = try fm.contentsOfDirectory(atPath: url.path+"/videos")
                for content in contents {
                    if content.first! != "." {
                        let format = String(content.split(separator: ".").last!)
                        if allowedVideoFormats.contains(format) {
                            v.append(Video(withUrl: url.appendingPathComponent(content)))
                        }
                    }
                 }
            } catch {
                NSLog("Sample: failed to load videos \(url.path)")
            }
            return v
        }
    }
    var microExpressionsSets: Array<MicroExpressionsSet> {
        get {
            var sets = Array<MicroExpressionsSet>()
            let fm = FileManager.default
            do {
                let contents = try fm.contentsOfDirectory(atPath: url.path+"/microExpressions")
                for content in contents {
                    if content.first! != "." {
                        let format = String(content.split(separator: ".").last!)
                        if format == "ltm" {
                            sets.append(MicroExpressionsSet(fromFile: url))
                        }
                    }
                }
            } catch {
                NSLog("Sample: failed to load microExpressionsSets \(url.path)")
            }
            return sets
        }
    }
    
    init(withUrl url: URL) {
        self.url = url
    }
    
}
