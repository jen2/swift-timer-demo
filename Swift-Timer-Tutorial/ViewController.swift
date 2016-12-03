//
//  ViewController.swift
//  Swift-Timer-Tutorial
//
//  Created by Jennifer A Sipila on 12/2/16.
//  Copyright © 2016 Jennifer A Sipila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!

    var seconds = 0
    var timer = Timer()
    var isTimerRunning = false
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if isTimerRunning == false {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
            
            isTimerRunning = true
        }
    }
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        seconds = 0
        timerLabel.text = timeString(time: TimeInterval(seconds))
        
        isTimerRunning = false
    }
    
    
    func updateTimer(){
        
        seconds += 1
        timerLabel.text = timeString(time: TimeInterval(seconds))
        
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

