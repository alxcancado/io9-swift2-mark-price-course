//
//  ViewController.swift
//  Fight Fantasy IV
//
//  Created by Alex Lima Lopes Cancado on 5/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLabel: UILabel!
    @IBOutlet weak var enemyHpLabel: UILabel!
    @IBOutlet weak var playerHpLabel: UILabel!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var chestButton: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "Ayer", hp: 110, attackPower: 20)
        playerHpLabel.text = "\(player.hp) HP"
        generateRandomEnemy()
        
    }

    @IBAction func attackTapped(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPower){
            printLabel.text = "Attacked \(enemy.type) for \(player.attackPower) HP"
            enemyHpLabel.text = "\(enemy.hp) HP"
        } else {
            printLabel.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLabel.text = ""
            printLabel.text = "Killed \(enemy.type)"
            enemyImage.hidden = true
            
        }
    }
    
    @IBAction func onChestPressed(sender: AnyObject) {
        chestButton.hidden = true
        printLabel.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
    }
    
    func generateRandomEnemy(){
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPower: 12)
        } else {
            enemy = DevilWizard(startingHp: 60, attackPower: 15)
        }
        enemyImage.hidden = false
    }

}

