//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    let softTime = 5
//    let mediumTime = 8
//    let hardTime = 12 
    var timer = Timer()
    var counter = 0
    override func viewDidLoad() {
      
    }
    var start = 60
    let eggTimes = ["Soft":5 ,"Medium" :8 , "Hard":12 ]
    @IBAction func eggPressed(_ sender: UIButton) {
        
        let hardness = sender.titleLabel?.text ?? "Medium"
        switch hardness {
        case "Soft":
            timer.invalidate()
            counter = eggTimes["Soft"] ?? 0
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)

        case "Medium":
//            print(eggTimes["Medium"] ?? 0)
            timer.invalidate()
            counter = eggTimes["Medium"] ?? 0
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        case "Hard":
            timer.invalidate()
            counter = eggTimes["Hard"] ?? 0
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
//            print(eggTimes["Hard"] ?? 0)
        default:
            print("default")
        }
    }
   
    @IBOutlet weak var timeToCook: UILabel!
    
    @objc func timerAction() {
        timeToCook.text = "\(counter)"
        if counter > 0 {
           
            counter -= 1
           
        }
    }
    

}
