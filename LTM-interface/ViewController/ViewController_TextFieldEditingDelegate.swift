//
//  ViewController_TextFieldEditingDelegate.swift
//  LTM-interface
//
//  Created by Louis Lenief on 16/05/2018.
//  Copyright © 2018 Louis Lenief. All rights reserved.
//

import Foundation
import Cocoa

extension ViewController: NSTextDelegate {
    
    func textDidEndEditing(_ notification: Notification) {
        print("did end editing: \(notification)")
    }
    
}
