//
//  ViewController_ActionHandler.swift
//  LTM-interface
//
//  Created by Louis Lenief on 08/05/2018.
//  Copyright © 2018 Louis Lenief. All rights reserved.
//

import Foundation
import Cocoa

extension ViewController {
    
    @objc func samplesAction(_ sender: AnyObject) {
        NSLog("samples clicked: \(samplesTableView.selectedRow)")
        videosTableView.reloadData()
        microExpressionsSetsTableView.reloadData()
        microExpressionsTableView.reloadData()
    }
    
}
