//
//  ViewController.swift
//  LTM-interface
//
//  Created by Louis Lenief on 07/05/2018.
//  Copyright © 2018 Louis Lenief. All rights reserved.
//

import Cocoa
import AVKit

class ViewController: NSViewController {

    
    var dataSet: DataSet?
    var player: AVPlayer?
    
    @IBOutlet weak var samplesTableView: NSTableView!
    @IBOutlet weak var videosTableView: NSTableView!
    @IBOutlet weak var microExpressionsSetsTableView: NSTableView!
    @IBOutlet weak var microExpressionsTableView: NSTableView!
    @IBOutlet weak var playerView: AVPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* setting up table views */
        
        samplesTableView.tag = TableViewTags.samples
        samplesTableView.delegate = self
        samplesTableView.dataSource = self
        samplesTableView.target = self
        samplesTableView.action = #selector(samplesAction(_:))
        
        videosTableView.tag = TableViewTags.videos
        videosTableView.delegate = self
        videosTableView.dataSource = self
        videosTableView.target = self
        videosTableView.action = #selector(videosAction(_:))
        
        microExpressionsSetsTableView.tag = TableViewTags.microExpressionsSets
        microExpressionsSetsTableView.delegate = self
        microExpressionsSetsTableView.dataSource = self
        microExpressionsSetsTableView.target = self
        microExpressionsSetsTableView.action = #selector(microExpressionsSetsAction(_:))
        
        microExpressionsTableView.tag = TableViewTags.microExpressions
        microExpressionsTableView.delegate = self
        microExpressionsTableView.dataSource = self
        microExpressionsTableView.target = self
        microExpressionsTableView.doubleAction = #selector(microExpressionsDoubleAction(_:))
        
        /* setting up the player */
        
        self.player = AVPlayer()
        playerView.player = self.player
        playerView.showsFrameSteppingButtons = true
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
            if let url = representedObject as? URL {
                dataSet = DataSet(withUrl: url)
                reloadData()
            }
        }
    }
    
    func reloadData() {
        samplesTableView.reloadData()
        videosTableView.reloadData()
        microExpressionsTableView.reloadData()
        microExpressionsSetsTableView.reloadData()
    }


}

