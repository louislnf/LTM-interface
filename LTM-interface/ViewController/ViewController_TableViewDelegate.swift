//
//  VC_TableViewDelegate.swift
//  LTM-interface
//
//  Created by Louis Lenief on 08/05/2018.
//  Copyright © 2018 Louis Lenief. All rights reserved.
//

import Foundation
import Cocoa

extension ViewController: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        switch tableView.tag {
        case TableViewTags.samples:
            if let sample = dataSet?.samples[row], let tc = tableColumn {
                switch tc.title {
                case "Name":
                    let ci = "samplesNameCellID"
                    if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(ci), owner: nil) as? NSTableCellView {
                        cell.textField?.stringValue = sample.name
                        return cell
                    }
                default:
                    break
                }
            }
        case TableViewTags.videos:
            // get selected sample
            let sampleRow = samplesTableView.selectedRow
            if sampleRow >= 0 {
                // a sample is selected
                if let sample = dataSet?.samples[sampleRow], let tc = tableColumn {
                    let video = sample.videos[row]
                    switch tc.title {
                    case "Name":
                        let ci = "videosNameCellID"
                        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(ci), owner: nil) as? NSTableCellView {
                            cell.textField?.stringValue = video.name
                            return cell
                        }
                    case "Framerate":
                        let ci = "videosFramerateCellID"
                        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(ci), owner: nil) as? NSTableCellView {
                            cell.textField?.stringValue = String(video.framerate)
                            return cell
                        }
                    default:
                        break
                    }
                }
            }
            break
        case TableViewTags.microExpressionsSets:
            // get selected sample
            let sampleRow = samplesTableView.selectedRow
            if sampleRow >= 0 {
                // a sample is selected
                if let sample = dataSet?.samples[sampleRow], let tc = tableColumn {
                    let microExpressionsSet = sample.microExpressionsSets[row]
                    switch tc.title {
                    case "Name":
                        let ci = "meSetsNameCellID"
                        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(ci), owner: nil) as? NSTableCellView {
                            cell.textField?.stringValue = microExpressionsSet.name
                            return cell
                        }
                    case "Source":
                        let ci = "meSetsSourceCellID"
                        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(ci), owner: nil) as? NSTableCellView {
                            cell.textField?.stringValue = microExpressionsSet.source
                            return cell
                        }
                    case "Color":
                        let ci = "meSetsColorCellID"
                        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(ci), owner: nil) as? NSColorWell {
                            cell.color = microExpressionsSet.color
                            return cell
                        }
                    default:
                        break
                    }
                }
            }
        case TableViewTags.videos:
            break
        default:
            break
        }
        return nil
    }
    
}
