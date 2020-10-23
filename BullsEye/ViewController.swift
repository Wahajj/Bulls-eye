//
//  ViewController.swift
//  BullsEye
//
//  Created by Muhammad Wahaj on 2/19/20.
//  Copyright © 2020 Muhammad Wahaj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentvalue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // currentvalue = Int (roundf(slider.value))
       //targetValue = 1 + Int(arc4random_uniform(100))
        startNewGame()
        updateLabel()
       
    }

    @IBAction func showAlert (){
        /*var difference = currentvalue - targetValue
        if difference < 0
        {
            difference = difference * -1
        } */
        let difference = abs(currentvalue - targetValue)
        var points =  100 - difference
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 && difference > 1
        {
            title = "you almost had it"
            points += 50
        }
        else if difference < 10
        {
            title = "Pretty close"
        }
        else { title = "Not even close to"
        }
        score += points
        
        /*let message = "The value of the slider is: \(currentvalue)" +
        "\n The target value is: \(targetValue)" +
        "\n The difference is: \(difference)" */
        
        let message = "you scored \(points) points"
        
      //  let alert = UIAlertController (title: "Hellow World", message: "This is my first app!", preferredStyle: .alert)
        let alert = UIAlertController (title: title , message: message, preferredStyle: .alert)
        
        
        //let action = UIAlertAction (title: "awsome!", style: .default, handler: nil)
        let action = UIAlertAction (title: "Ok", style: .default, handler: nil)
      //  let anotheraction = UIAlertAction(title: "NIceeeeee", style: .destructive, handler : nil)
        
        alert.addAction(action)
       // alert.addAction(anotheraction)
        present (alert, animated: true, completion: nil)
        
        startNewRound()
        updateLabel()
    }
    
    //slider pe touch krny pe jo ho raha
    @IBAction func slidermove(_ slider:UISlider)
    {
        // print ("The value of slider is now:\(slider.value)")
        
        //slider ki value current value mai save ho rhe usy move krny k sath sath
        currentvalue = Int (roundf(slider.value))
    }
   //so that we can use slider var anywhere in the code
    @IBOutlet weak var slider: UISlider!
    
    func startNewRound ()
    {
        round = round + 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentvalue = 50
        slider.value = Float(currentvalue)
    }
    
    // so that we can use targetlabel anywhere in code
    @IBOutlet weak var targetLabel : UILabel!
    @IBOutlet weak var scoreLabel : UILabel!
    @IBOutlet weak var roundLabel : UILabel!
    
    func updateLabel ()
    {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String (score)
        roundLabel.text = String (round)
    }
    
    func startNewGame (){
        score = 0
        round = 0
        startNewRound()
    }
    @IBAction func startOver (){
        startNewGame()
        updateLabel()
    }
}

