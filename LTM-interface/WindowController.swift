//
//  WindowController.swift
//  LTM-interface
//
//  Created by Louis Lenief on 08/05/2018.
//  Copyright © 2018 Louis Lenief. All rights reserved.
//

import Foundation
import Cocoa

class WindowController: NSWindowController {
    
    @IBAction func openDataSet(_ sender: Any) {
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = false
        panel.canChooseDirectories = true
        panel.canChooseFiles = false
        
        if panel.runModal() == NSApplication.ModalResponse.OK {
            if let url = panel.urls.first {
                if let viewController = self.contentViewController {
                    viewController.representedObject = url
                }
            }
        }
    }
    
}
