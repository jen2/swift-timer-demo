//
//  InterfaceController.swift
//  Timer Extension
//
//  Created by durul dalkanat on 2/22/17.
//  Copyright © 2017 Jennifer A Sipila. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    //MARK: - IBOutlets
    @IBOutlet var btnStart: WKInterfaceButton!
    @IBOutlet var btnReset: WKInterfaceButton!
    @IBOutlet var pauseButton: WKInterfaceButton!
    @IBOutlet var timerLabel: WKInterfaceLabel!
    
    //MARK: - Properties
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false

    
    //MARK: - Super Methods
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
            pauseButton.setEnabled(false)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    //MARK: - IBActions
    @IBAction func startBtnAction() {
        if isTimerRunning == false {
            self.btnStart.setEnabled(false)
            pauseButton.setEnabled(true)
            runTimer()
        }
    }
    
    @IBAction func resertBtnAction() {
        btnStart.setTitle("Start")
        seconds = 60
        timerLabel.setText(timeString(time: TimeInterval(seconds)))
        timer.invalidate()
        isTimerRunning = false
    }
    
    @IBAction func pauseBtnAction() {
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
            self.pauseButton.setTitle("Resume")

        } else {
            runTimer()
            self.resumeTapped = false
            self.pauseButton.setTitle("Pause")
        }
    }
    
    //MARK: - Public Method
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func updateTimer(){
        if seconds < 1 {
            timer.invalidate()
            //Send alert to indicate time's up.
        } else {
            seconds -= 1
            timerLabel.setText(timeString(time: TimeInterval(seconds)))

        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)),
                                     userInfo: nil, repeats: true)
        isTimerRunning = true
        pauseButton.setEnabled(true)

    }
    
}

















