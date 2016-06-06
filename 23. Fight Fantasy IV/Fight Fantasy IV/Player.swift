//
//  Player.swift
//  Fight Fantasy IV
//
//  Created by Alex Lima Lopes Cancado on 5/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import Foundation

class Player: Character {
    
    private var _name = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        return _inventory
    }
    
    convenience init (name: String, hp: Int, attackPower: Int) {
        self.init(startingHp: hp, attackPower: attackPower)
        
        _name = name
    }
    
    func addItemToInventory(item: String){
        _inventory.append(item)
    }
}