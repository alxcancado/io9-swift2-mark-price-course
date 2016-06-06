//
//  Enemy.swift
//  Fight Fantasy IV
//
//  Created by Alex Lima Lopes Cancado on 5/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import Foundation


class Enemy: Character {
    
    var loot: [String]{
        return ["Rusty Dagger","Cracked Buckler"]
    }
    
    var type: String{
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        
        if !isAlive {
            let random = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[random]
        }
        
        return nil
    }
}