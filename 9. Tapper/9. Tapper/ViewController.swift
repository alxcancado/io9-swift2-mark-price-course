//
//  ViewController.swift
//  9. Tapper
//
//  Created by Alex Lima Lopes Cancado on 10/11/15.
//  Copyright © 2015 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Properties
    var maxTaps = 0
    var currentTaps = 0
    
    // Outlets
    @IBOutlet weak var tapperLogoImage: UIImageView!
    @IBOutlet weak var howManyTapsText: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var coinButton: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    @IBAction func onPlayButtonPressed(sender: UIButton!){
        
        if howManyTapsText.text != nil && howManyTapsText.text != "" {
            
            tapperLogoImage.hidden = true
            howManyTapsText.hidden = true
            playButton.hidden = true
            
            coinButton.hidden = false
            tapsLabel.hidden = false
            
            
            maxTaps = Int(howManyTapsText.text!)!
            currentTaps = 0
            
            updateTapsLabel()
        }
    }
    
    @IBAction func onCoinButtonPressed(sender: UIButton!){
        currentTaps += 1
        updateTapsLabel()
        
        if isGameOver(){
            restartGame()
        }
    }
    
    
    
    func updateTapsLabel() {
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    
    
    func isGameOver() -> Bool{
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    
    func restartGame(){
        maxTaps = 0
        howManyTapsText.text = ""
        currentTaps = 0
        
        tapperLogoImage.hidden = false
        howManyTapsText.hidden = false
        playButton.hidden = false
        
        coinButton.hidden = true
        tapsLabel.hidden = true
    }

}

