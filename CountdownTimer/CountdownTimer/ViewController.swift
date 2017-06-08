//
//  ViewController.swift
//  CountdownTimer
//
//  Created by Sumit Bansal on 6/8/17.
//  Copyright © 2017 Sumit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startTimerBtn: UIButton!
    
    @IBOutlet weak var pauseTimerBtn: UIButton!
    @IBOutlet weak var resetTimerBtn: UIButton!
 
    var seconds = 0;
    
    var timer = Timer()
    
    var isTimerRunning = false
    
    var pausedBtnTouched = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pauseTimerBtn.isEnabled = false

        
    }

    @IBAction func startTouched(_ sender: Any) {
        
        if(isTimerRunning == false)
        {
        runtimer()
        self.startTimerBtn.isEnabled = false
                }
    }
    
    
    @IBAction func pausetouched(_ sender: Any) {
        if(pausedBtnTouched == false){
        timer.invalidate()
            pauseTimerBtn.setTitle("Resume", for: .normal)
            pausedBtnTouched = true
        }else{
            runtimer()
            pausedBtnTouched = false
            pauseTimerBtn.setTitle("Pause", for: .normal)
        }
        
    }
    
    @IBAction func resetTouched(_ sender: Any) {
        timer.invalidate()
        seconds = 0
        timerLabel.text = ("00:00:00")
        isTimerRunning = false
        self.startTimerBtn.isEnabled = true
        self.pauseTimerBtn.setTitle("Pause", for: .normal)
        self.pauseTimerBtn.isEnabled = false
        self.pausedBtnTouched = false
        
    }
    
    func runtimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        pauseTimerBtn.isEnabled = true

    }
    
    func updateTimer(){
        seconds+=1
        var et = ""
        et = timeString(time: TimeInterval(seconds))
        timerLabel.text = et
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
      return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
        
        //return String(" \(hours) : \( minutes) : \( seconds)")
    }
    
}

