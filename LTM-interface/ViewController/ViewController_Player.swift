//
//  ViewController_Player.swift
//  LTM-interface
//
//  Created by Louis Lenief on 09/05/2018.
//  Copyright © 2018 Louis Lenief. All rights reserved.
//

import Foundation
import AVKit

extension ViewController {
    
    func playSelectedVideo() {
        // get selected Video
        let sampleRow = samplesTableView.selectedRow
        let videoRow = videosTableView.selectedRow
        
        if sampleRow >= 0 && videoRow >= 0 {
            if let video = dataSet?.samples[sampleRow].videos[videoRow] {
                player?.replaceCurrentItem(with: AVPlayerItem(url: video.url))
                player?.play()
                //player?.setRate(1.0, time: CMTime(), atHostTime: CMTime())
            }
        }
    }
}
