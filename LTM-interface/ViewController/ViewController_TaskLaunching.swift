//
//  ViewController_TaskLaunching.swift
//  LTM-interface
//
//  Created by Louis Lenief on 10/05/2018.
//  Copyright © 2018 Louis Lenief. All rights reserved.
//

import Foundation

extension ViewController {
    
    @IBAction func launchTask(_ sender: Any) {
        let process = Process()
        process.launchPath = "/bin/pwd"
        process.terminationHandler = { (p: Process) in
            NSLog("process terminated: \(process.terminationStatus)")
        }
        do {
            try process.run()
        } catch {
            NSLog("failed to run process.")
        }
    }
    
}
