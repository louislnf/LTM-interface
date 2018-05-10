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
        videosTableView.reloadData()
        microExpressionsSetsTableView.reloadData()
        microExpressionsTableView.reloadData()
    }
    
    @objc func videosAction(_ sender: AnyObject) {
        playSelectedVideo()
    }
    
    @objc func microExpressionsSetsAction(_ sender: AnyObject) {
        microExpressionsTableView.reloadData()
    }
    
    @objc func microExpressionsDoubleAction(_ sender: AnyObject) {
        if let me = getSelectedMicroExpression() {
            goToFrame(frame: me.onset)
        }
    }
    
}
