//
//  ViewController_GetSelected.swift
//  LTM-interface
//
//  Created by Louis Lenief on 10/05/2018.
//  Copyright © 2018 Louis Lenief. All rights reserved.
//

import Foundation
import Cocoa

extension ViewController {
    
    func getSelectedSample() -> Sample? {
        if let ds = dataSet {
            let sampleRow = samplesTableView.selectedRow
            if sampleRow >= 0 && sampleRow < ds.samples.count {
                return ds.samples[sampleRow]
            }
        }
        return nil
    }
    
    func getSelectedVideo() -> Video? {
        if let sample = getSelectedSample() {
            let videoRow = videosTableView.selectedRow
            if videoRow >= 0 && videoRow < sample.videos.count {
                return sample.videos[videoRow]
            }
        }
        return nil
    }
    
    func getSelectedMicroExpressionsSet() -> MicroExpressionsSet? {
        if let sample = getSelectedSample() {
            let meSetRow = microExpressionsSetsTableView.selectedRow
            if meSetRow >= 0 && meSetRow < sample.microExpressionsSets.count {
                return sample.microExpressionsSets[meSetRow]
            }
        }
        return nil
    }
    
    func getSelectedMicroExpression() -> MicroExpression? {
        if let meSet = getSelectedMicroExpressionsSet() {
            let meRow = microExpressionsTableView.selectedRow
            if meRow >= 0 && meRow < meSet.data.count {
                return meSet.data[meRow]
            }
        }
        return nil
    }
}
