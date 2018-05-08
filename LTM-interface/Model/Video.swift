//
//  Video.swift
//  LTM-interface
//
//  Created by Louis Lenief on 08/05/2018.
//  Copyright © 2018 Louis Lenief. All rights reserved.
//

import Foundation

class Video {
    
    var url: URL
    
    var name: String {
        get {
            return url.lastPathComponent
        }
    }
    
    init(withUrl url: URL) {
        self.url = url
    }
}
