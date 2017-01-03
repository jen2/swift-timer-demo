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

    var seconds = 0 // To make this time count down set an amount of seconds that is greater than 0 here.
    var timer = Timer()
    var isTimerRunning = false
    var pauseTapped = true
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if isTimerRunning == false {
            runTimer()
        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        
        isTimerRunning = true
    }
    
    //Resume functionality for timer counting up from 0.
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        if pauseTapped == true {
            timer.invalidate()
            pauseTapped = false
        }
        if pauseTapped == false {
            runTimer()
            pauseTapped = true
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        seconds = 0 //To keep that initial starting value of seconds change this to the same as above.
        timerLabel.text = timeString(time: TimeInterval(seconds))
        
        isTimerRunning = false
    }
    
    func updateTimer(){
        
        seconds += 1 //Now the timer needs to count down so change "seconds += 1" to "seconds -= 1".
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

