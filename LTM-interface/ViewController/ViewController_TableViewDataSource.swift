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
            let row = samplesTableView.selectedRow
            if row >= 0 {
                if let sample = dataSet?.samples[row] {
                    return sample.videos.count
                }
            }
        case TableViewTags.microExpressionsSets:
            // get selected sample
            let row = samplesTableView.selectedRow
            if row >= 0 {
                if let sample = dataSet?.samples[row] {
                    return sample.microExpressionsSets.count
                }
            }
        case TableViewTags.microExpressions:
            // get selected sample and ME-Set
            let sampleRow = samplesTableView.selectedRow
            let meSetRow = samplesTableView.selectedRow
            if sampleRow >= 0 && meSetRow >= 0 {
                return dataSet?.samples[sampleRow].microExpressionsSets[meSetRow].data.count ?? 0
            }
        default:
            break
        }
        return 0
    }
}
