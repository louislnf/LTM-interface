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
            if let sample = getSelectedSample(), let tc = tableColumn {
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
            break
        case TableViewTags.microExpressionsSets:
            if let sample = getSelectedSample(), let tc = tableColumn {
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
                    if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(ci), owner: nil) as? ColorTableCellView {
                        cell.colorWell.color = microExpressionsSet.color
                        return cell
                    }
                default:
                    break
                }
            }
            break
        case TableViewTags.microExpressions:
            if let meSet = getSelectedMicroExpressionsSet(), let tc = tableColumn {
                switch tc.title {
                case "Onset":
                    let ci = "meOnsetCellID"
                    if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(ci), owner: nil) as? NSTableCellView {
                        cell.textField?.stringValue = String(meSet.data[row].onset)
                        if isEditingMeRow && editedMeRow == row {
                            cell.textField?.isEditable = true
                        }
                        return cell
                    }
                    break
                case "Offset":
                    let ci = "meOffsetCellID"
                    if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(ci), owner: nil) as? NSTableCellView {
                        cell.textField?.stringValue = String(meSet.data[row].offset)
                        if isEditingMeRow && editedMeRow == row {
                            cell.textField?.isEditable = true
                        }
                        return cell
                    }
                    break
                case "Description":
                    let ci = "meDescriptionCellID"
                    if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(ci), owner: nil) as? NSTableCellView {
                        cell.textField?.stringValue = meSet.data[row].description
                        if isEditingMeRow && editedMeRow == row {
                            cell.textField?.isEditable = true
                        }
                        return cell
                    }
                    break
                case "Action Unit":
                    let ci = "meOnsetCellID"
                    if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(ci), owner: nil) as? NSTableCellView {
                        cell.textField?.stringValue = String(meSet.data[row].actionUnit)
                        if isEditingMeRow && editedMeRow == row {
                            cell.textField?.isEditable = true
                        }
                        return cell
                    }
                    break
                default:
                    break
                }
            }
            break
        default:
            break
        }
        return nil
    }
    
}
