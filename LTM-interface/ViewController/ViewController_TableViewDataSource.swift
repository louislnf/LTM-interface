//
//  VC_DataSource.swift
//  LTM-interface
//
//  Created by Louis Lenief on 08/05/2018.
//  Copyright © 2018 Louis Lenief. All rights reserved.
//

import Foundation
import Cocoa

extension ViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        switch(tableView.tag) {
        case TableViewTags.samples:
            return dataSet?.samples.count ?? 0
        case TableViewTags.videos:
            // get selected sample
            if let sample = getSelectedSample() {
                return sample.microExpressionsSets.count
            }
        case TableViewTags.microExpressionsSets:
            // get selected sample
            if let sample = getSelectedSample() {
                return sample.microExpressionsSets.count
            }
        case TableViewTags.microExpressions:
            // get selected sample and ME-Set
            if let meSet = getSelectedMicroExpressionsSet() {
                return meSet.data.count
            }
        default:
            break
        }
        return 0
    }
}
