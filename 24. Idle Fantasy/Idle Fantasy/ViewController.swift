//
//  ViewController.swift
//  Idle Fantasy
//
//  Created by Alex Lima Lopes Cancado on 6/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player1: Character
    var player2: Character
    var message: String

    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1 = Character(hp: 100, attack: 10, name: "Player 1")
        player2 = Character(hp: 100, attack: 10, name: "Player 2")
        
        
    }

}

