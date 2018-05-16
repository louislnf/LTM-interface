//
//  MicroExpressionSet.swift
//  LTM-interface
//
//  Created by Louis Lenief on 07/05/2018.
//  Copyright © 2018 Louis Lenief. All rights reserved.
//

import Foundation
import Cocoa

class MicroExpressionsSet {
    
    var url: URL
    var source: String
    var colorInt: Int
    var color: NSColor {
        get {
            let colors = [NSColor(red: 1, green: 0, blue: 0, alpha: 0),
                          NSColor(red: 1, green: 0.5, blue: 0, alpha: 0),
                          NSColor(red: 1, green: 1, blue: 0, alpha: 0),
                          NSColor(red: 0, green: 1, blue: 0, alpha: 0),
                          NSColor(red: 0, green: 0.5, blue: 1, alpha: 0),
                          NSColor(red: 0, green: 1, blue: 1, alpha: 0),
                          NSColor(red: 0, green: 0, blue: 1, alpha: 0),
                          NSColor(red: 1, green: 0, blue: 1, alpha: 0)]
            if colorInt >= 0 && colorInt < colors.count {
                return colors[colorInt]
            } else {
                return NSColor.white
            }
        }
    }
    var data: Array<MicroExpression>
    
    var name: String {
        get {
            return url.lastPathComponent
        }
    }
    
    init(fromFile url: URL) {
        self.url = url
        self.source = ""
        self.colorInt = -1
        self.data = Array<MicroExpression>()
        do {
            let content = try String(contentsOf: url)
            let lines = content.split(separator: "\n")
            let numberOfLines = lines.count
            if numberOfLines > 0 {
                //getting the header line info
                let headers = lines[0].split(separator: ";")
                self.source = String(headers[0])
                self.colorInt = Int(headers[1]) ?? -1 // to do to do
                
                // getting the micro expressions
                for i in 1..<numberOfLines {
                    //data is stored: onset;offset;description;actionUnit
                    let meInfos = lines[i].split(separator: ";")
                    if meInfos.count >= 4 {
                        var me = MicroExpression()
                        me.onset = Int(meInfos[0]) ?? 0
                        me.offset = Int(meInfos[1]) ?? 0
                        me.description = String(meInfos[2])
                        me.actionUnit = Int(meInfos[3]) ?? 0
                        self.data.append(me)
                    }
                }
                print("source: \(source)")
                print("data: \(data)")
            }
        } catch {
            NSLog("MicroExpression: init from file failed (url = \(url)")
        }
    }
    
    func remove(meIndex: Int) {
        data.remove(at: meIndex)
    }
    
    func add(me: MicroExpression) {
        data.append(me)
    }
    
    func save() {
        let fm = FileManager.default
        var stringToWrite = ""
        stringToWrite.append(source)
        stringToWrite.append(";")
        stringToWrite.append(String(colorInt))
        stringToWrite.append("\n")
        for me in data {
            stringToWrite += "\(me.onset);\(me.offset);\(me.description);\(me.actionUnit)\n"
        }
        if fm.fileExists(atPath: url.path) {
            do {
                try stringToWrite.write(to: url, atomically: false, encoding: String.Encoding.utf8)
                NSLog("Successfully saved me set to url: \(url)")
            } catch {
                NSLog("Failed to write me set to url: \(url)")
            }
        }
    }
    
    
}
