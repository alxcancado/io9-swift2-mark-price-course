//
//  ViewController.swift
//  bitcalc
//
//  Created by Alex Lima Lopes Cancado on 3/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var bitSound: AVAudioPlayer!
    var runningNumber = ""
    var leftVarString = ""
    var rightVarString = ""
    var result = ""
    var currentOperation: Operation = Operation.Empty
    
    @IBOutlet weak var outputScreen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try bitSound = AVAudioPlayer(contentsOfURL: soundUrl)
            bitSound.prepareToPlay()
        } catch let err as NSError {
            print((err.debugDescription))
        }
        
        
    }
    
    @IBAction func numberPressed(button: UIButton!){
        
        playSound()
        
        runningNumber += "\(button.tag)"
        outputScreen.text = runningNumber
        
    }

    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }

    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    func processOperation(operation: Operation){
        playSound()
        
        if currentOperation != Operation.Empty {
            // run some math
            
            // a user selected an operator but then selected another operator without select a number
            if runningNumber != "" {
                rightVarString = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply{
                    result = "\(Double(leftVarString)! * Double(rightVarString)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftVarString)! / Double(rightVarString)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftVarString)! - Double(rightVarString)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftVarString)! + Double(rightVarString)!)"
                }
            }
            
            
            leftVarString = result
            outputScreen.text = result
            
            currentOperation = operation
            
        } else {
            // first time an operator has been pressed
            leftVarString = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    func playSound(){
        
        if (bitSound.playing){
            bitSound.stop()
        }
        bitSound.play()
    }
    
    
}

