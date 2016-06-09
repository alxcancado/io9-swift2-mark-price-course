//
//  ViewController.swift
//  Idle Fantasy
//
//  Created by Alex Lima Lopes Cancado on 6/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player1: Character!
    var player2: Character!
    var message: String = ""
    
    @IBOutlet weak var player1AttackButton: UIButton!
    @IBOutlet weak var player1AttackLabel: UILabel!
    @IBOutlet weak var player1HpLabel: UILabel!
    @IBOutlet weak var player1Image: UIImageView!
    
    @IBOutlet weak var player2AttackButton: UIButton!
    @IBOutlet weak var player2AttackLabel: UILabel!
    @IBOutlet weak var player2HpLabel: UILabel!
    @IBOutlet weak var player2Image: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1 = Character(hp: 100, attack: 10, name: "Player 1")
        player2 = Character(hp: 100, attack: 10, name: "Player 2")
        
    }
    
    @IBAction func onAttackPressed(sender: UIButton) {
        
        sender.alpha = 0.5
        sender.userInteractionEnabled = false
        
        if sender.tag == 1 {
            player1.attack(player1.attack, who: player2)
            messageLabel.text = "Player 1 attacks Player 2"
            player2HpLabel.text = "HP: \(player2.hp)"
            player1AttackLabel.text = "Wait"
            
            if !player2.isAlive {
                player2HpLabel.text = ""
                messageLabel.text = "Player 2 was Killed"
                player2Image.hidden = true
                playAgainButton.hidden = false
                
                showHideUI()
            }

            
        } else if sender.tag == 2 {
            player2.attack(player2.attack, who: player1)
            messageLabel.text = "Player 2 attacks Player 1"
            player1HpLabel.text = "HP: \(player1.hp)"
            player2AttackLabel.text = "Wait"
            
            if !player1.isAlive {
                player1HpLabel.text = ""
                messageLabel.text = "Player 1 was Killed"
                player1Image.hidden = true
                playAgainButton.hidden = false
                
                showHideUI()
                
            }
            
        }
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.enableAttack(_:)), userInfo: sender, repeats: false)
        
    }
    
    @IBAction func onPlayAgainPressed(){
        playAgainButton.hidden = true
        
        player1 = Character(hp: 100, attack: 10, name: "Player 1")
        player2 = Character(hp: 100, attack: 10, name: "Player 2")
        
        messageLabel.text = "Tap Attack to win the battle!"
        
        player2Image.hidden = false
        player1Image.hidden = false
        
        player2HpLabel.text = "\(player2.hp)"
        player1HpLabel.text = "\(player1.hp)"
        
        player2AttackLabel.text = "Attack"
        player1AttackLabel.text = "Attack"
        
        player2AttackButton.alpha = 1.0
        player2AttackButton.userInteractionEnabled = true
        player1AttackButton.alpha = 1.0
        player1AttackButton.userInteractionEnabled = true
        
        showHideUI()
        
    }
    
    func enableAttack(timer:NSTimer){
        let sender = timer.userInfo as! UIButton
        sender.alpha = 1
        sender.userInteractionEnabled = true
        //print(sender.tag)
        
        if sender.tag == 1 {
            player1AttackLabel.text = "Attack"
        } else if sender.tag == 2 {
            player2AttackLabel.text = "Attack"
        }
    }
    
    func showHideUI(){
        player2AttackButton.hidden = !player2AttackButton.hidden
        player1AttackButton.hidden = !player1AttackButton.hidden
        
        player2AttackLabel.hidden = !player2AttackLabel.hidden
        player1AttackLabel.hidden = !player1AttackLabel.hidden
    }
    
    
}

