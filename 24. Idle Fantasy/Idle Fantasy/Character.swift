//
//  Character.swift
//  Idle Fantasy
//
//  Created by Alex Lima Lopes Cancado on 7/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import Foundation

class Character {
    
    // properties
    private var _hp: Int = 10
    private var _attack: Int = 1
    private var _name: String
    
    // constructor
    init(hp: Int, attack: Int, name: String){
        self._hp = hp
        self._attack = attack
        self._name = name
    }
    
    // getters and setters
    var hp: Int {
        get {
            return _hp
        }
        
    }
    
    var attack: Int {
        get {
            return _attack
        }
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    var isAlive: Bool {
        get {
            if _hp <= 0 {
                // dead
                return false
            } else {
                return true
            }
        }
    }
    
    // actions
    func attack (attack: Int, who: Character) -> Bool {
        who._hp -= attack
        return true
    }
}