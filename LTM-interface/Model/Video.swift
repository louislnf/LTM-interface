//
//  Video.swift
//  LTM-interface
//
//  Created by Louis Lenief on 08/05/2018.
//  Copyright © 2018 Louis Lenief. All rights reserved.
//

import Foundation
import AVKit

class Video {
    
    var url: URL
    
    var name: String {
        get {
            return url.lastPathComponent
        }
    }
    
    var framerate: Double {
        let asset = AVAsset(url: url)
        return Double(asset.tracks.first?.nominalFrameRate ?? 0.0)
    }
    
    init(withUrl url: URL) {
        self.url = url
    }
}
