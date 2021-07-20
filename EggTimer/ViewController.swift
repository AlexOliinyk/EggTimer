//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTime: [String: Int] = [
        "Soft": 3,
        "Medium": 4,
        "Hard": 7
    ]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTime[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        // перезапускаем таймер после каждого нажатия на кнопку.
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
        //        switch hardness {
        //        case "Soft":
        //            print(eggTime["Soft"]!)
        //        case "Medium":
        //            print(eggTime["Medium"]!)
        //        default:
        //            print(eggTime["Hard"]!)
        //        }
        //
        //        if hardness == "Soft" {
        //            print(eggTime["Soft"]!)
        //        } else if hardness == "Medium" {
        //            print(eggTime["Medium"]!)
        //        } else {
        //            print(eggTime["Hard"]!)
        //        }
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
            print(Float(secondsPassed) / Float(totalTime))
            
        } else {
            timer.invalidate()
            titleLabel.text = "The eggs is DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
        
        
    }
    
    
}
