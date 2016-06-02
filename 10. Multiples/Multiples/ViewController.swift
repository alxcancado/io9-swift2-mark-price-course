//
//  ViewController.swift
//  Multiples
//
//  Created by Alex Lima Lopes Cancado on 1/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // properties
    var multipleNumber = 0
    var counter = 0
    
    // Outlets
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    // Actions
    @IBAction func onPlayButtonPressed(sender: UIButton!){
        
        //self.inputTextField.keyboardType = UIKeyboardType.NumberPad
        
        if inputTextField.text != nil && inputTextField.text != "" {
            
            logo.hidden = true
            inputTextField.hidden = true
            playButton.hidden = true
            
            backButton.hidden = false
            addButton.hidden = false
            resultsLabel.hidden = false
            
            multipleNumber = Int(inputTextField.text!)!
        }
    }
    
    
    @IBAction func onAddButtonPressed(sender: UIButton!){
        
        resultsLabel.text = "\(counter) + \(multipleNumber) = \(counter + multipleNumber)"
        counter = counter + multipleNumber

    }
    
    
    @IBAction func onBackButtonPressed(sender: UIButton!){
        // resets
        logo.hidden = false
        inputTextField.hidden = false
        playButton.hidden = false
        
        backButton.hidden = true
        addButton.hidden = true
        resultsLabel.hidden = true
        
        inputTextField.text = ""
        resultsLabel.text = "press ADD"
        multipleNumber = 0
        counter = 0
        
    }
    
    
    
    // trick to hide the status bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

