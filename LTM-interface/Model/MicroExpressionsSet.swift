//
//  MicroExpressionSet.swift
//  LTM-interface
//
//  Created by Louis Lenief on 07/05/2018.
//  Copyright © 2018 Louis Lenief. All rights reserved.
//

import Foundation

class MicroExpressionsSet {
    
    var source: String
    var color: String
    var data: Array<MicroExpression>
    
    init(fromFile url: URL) {
        self.source = ""
        self.color = ""
        self.data = Array<MicroExpression>()
        do {
            let content = try String(contentsOf: url)
            let lines = content.split(separator: "\n")
            
            let numberOfLines = lines.count
            if numberOfLines > 0 {
                //getting the header line info
                let headers = lines[0].split(separator: ";")
                self.source = String(headers[0])
                self.color = String(headers[1])
                
                // getting the micro expressions
                for i in 1...numberOfLines {
                    //data is stored: onset;offset;description;actionUnit
                    let meInfos = lines[i].split(separator: ";")
                    var me = MicroExpression()
                    me.onset = Int(meInfos[0]) ?? 0
                    me.offset = Int(meInfos[1]) ?? 0
                    me.description = String(meInfos[2])
                    me.description = String(meInfos[3])
                    
                    self.data.append(me)
                }
            }
        } catch {
            NSLog("MicroExpression: init from file failed (url = \(url)")
        }
    }
    
}
