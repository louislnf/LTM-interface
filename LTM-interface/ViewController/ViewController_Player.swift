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
        if let video = getSelectedVideo() {
            player?.replaceCurrentItem(with: AVPlayerItem(url: video.url))
            player?.play()
        }
    }
    
    func goToFrame(frame: Int) {
        if let video = getSelectedVideo() {
            let s = Double(frame)/video.framerate
            player?.seek(to: CMTime(seconds: s, preferredTimescale: 60), toleranceBefore: kCMTimeZero, toleranceAfter: kCMTimeZero)
        }
    }
    
    /* menu action handlers */
    
    @IBAction func menuTogglePlay(_ sender: Any) {
        if let p = player {
            if p.rate != 0.0 {
                p.pause()
            } else {
                p.play()
            }
        }
    }
    
    @IBAction func menuRestart(_ sender: Any) {
        playSelectedVideo()
    }
    
    @IBAction func menuSetRate(_ sender: Any) {
        if let menuItem = sender as? NSMenuItem {
            let newRate = Float(menuItem.title)
            player?.rate = newRate!
        }
    }
    
}
