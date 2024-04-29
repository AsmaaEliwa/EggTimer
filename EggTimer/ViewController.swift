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
    var player: AVAudioPlayer? = nil
    @IBOutlet weak var isDone: UILabel!
    //    let softTime = 5
//    let mediumTime = 8
//    let hardTime = 12 
    var timePassed:Float = 0.0
    var timeLeft:Float = 0.0
    var timer = Timer()
    var counter = 0
    override func viewDidLoad() {
      
    }
    var start = 60
    let eggTimes = ["Soft":5.0 ,"Medium" :8.0 , "Hard":12.0 ]
    @IBAction func eggPressed(_ sender: UIButton) {
        timeBar.progress = 0.0
        isDone.text = "How do you like your eggs?"
        let hardness = sender.titleLabel?.text ?? "Medium"
        switch hardness {
        case "Soft":
            timer.invalidate()
            timeLeft = Float(eggTimes["Soft"] ?? 0.0)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)

        case "Medium":
//            print(eggTimes["Medium"] ?? 0)
            timer.invalidate()
            timeLeft = Float(eggTimes["Medium"] ?? 0.0)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        case "Hard":
            timer.invalidate() // this to reset the timer when pressed on a difft=rent btn
            timeLeft = Float(eggTimes["Hard"] ?? 0.0)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
//            print(eggTimes["Hard"] ?? 0)
        default:
            print("default")
        }
    }
   
    @IBOutlet weak var timeToCook: UILabel!
    
    @IBOutlet weak var timeBar: UIProgressView!
    @objc func timerAction() {
//        timeToCook.text = "\(counter)"
        
        
        let progressTime:Float  =  timePassed / timeLeft
        print(timePassed  , timeLeft)
        print(progressTime)
        timeBar.progress = progressTime
        if timePassed < timeLeft  {
            timePassed+=1
            counter -= 1
            timeBar.progress = progressTime
        }else{
            do {
                player =  try? AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "alarm_sound", ofType: "mp3")!) as URL)
            } catch(let error) {
                print(error.localizedDescription)
            }
            player?.play()
            isDone.text = "Done!"
            
        }
    }
    

}
