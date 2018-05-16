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
        lastSelectedMeRow = -1
        isEditingMeRow = false
        editedMeRow = -1
    }
    
    
    
    @objc func microExpressionsAction(_ sender: AnyObject) {
        print("microExpressionsAction")
        let selectedRow = microExpressionsTableView.selectedRow
        if selectedRow >= 0 {
            if selectedRow == lastSelectedMeRow {
                if !isEditingMeRow {
                    isEditingMeRow = true
                    editedMeRow = selectedRow
                    microExpressionsTableView.reloadData()
                }
            } else {
                if isEditingMeRow {
                    //getting edited row and saving it
                    var meInfos = [String]()
                    for i in 0..<4 {
                        if let cell = microExpressionsTableView.view(atColumn: i, row: lastSelectedMeRow, makeIfNecessary: false) as? NSTableCellView {
                            if let s = cell.textField?.stringValue {
                                meInfos.append(s)
                            }
                        }
                    }
                    if meInfos.count == 4 {
                        if let meSet = getSelectedMicroExpressionsSet() {
                            meSet.data[lastSelectedMeRow].onset = Int(meInfos[0]) ?? meSet.data[lastSelectedMeRow].onset
                            meSet.data[lastSelectedMeRow].offset = Int(meInfos[1]) ?? meSet.data[lastSelectedMeRow].offset
                            meSet.data[lastSelectedMeRow].description = meInfos[2]
                            meSet.data[lastSelectedMeRow].actionUnit = Int(meInfos[3]) ?? meSet.data[lastSelectedMeRow].onset
                            meSet.save()
                            microExpressionsTableView.reloadData()
                        }
                    }
                    isEditingMeRow = false
                }
            }
            lastSelectedMeRow = selectedRow
        }
    }
    
    @objc func microExpressionsDoubleAction(_ sender: AnyObject) {
        if let me = getSelectedMicroExpression() {
            goToFrame(frame: me.onset)
        }
    }
    
    @IBAction func meRemove(_ sender: Any) {
        let row = microExpressionsTableView.selectedRow
        if let selectedMESet = getSelectedMicroExpressionsSet() {
            if row >= 0 && row < selectedMESet.data.count {
                selectedMESet.remove(meIndex: row)
                selectedMESet.save()
                microExpressionsTableView.reloadData()
            }
        }
    }
    
    @IBAction func meAdd(_ sender: Any) {
        if let selectedMESet = getSelectedMicroExpressionsSet() {
            selectedMESet.add(me: MicroExpression(onset: 0, offset: 0, description: "none", actionUnit: -1))
            selectedMESet.save()
            microExpressionsTableView.reloadData()
        }
    }
    
}
