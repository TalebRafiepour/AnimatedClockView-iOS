//
//  ViewController.swift
//  AnimatedClockDemo
//
//  Created by Taleb on 9/18/19.
//  Copyright © 2019 Taleb. All rights reserved.
//

import UIKit
import AnimatedClockView

class ViewController: UIViewController {
    
    @IBOutlet weak var animatedClock: AnimatedClockView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startAnimateClock(_ sender: Any) {
        animatedClock.animate = true
    }
    
    @objc func changeColorOfClock() {
        animatedClock.clockColor = UIColor.red
    }
    
    @IBAction func stopAnimateClock(_ sender: Any) {
        animatedClock.animate = false
    }
    
    @IBAction func resetClock(_ sender: Any) {
        animatedClock.resetClock()
    }
    
}

