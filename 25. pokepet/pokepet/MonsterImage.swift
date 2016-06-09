//
//  MonsterImage.swift
//  pokepet
//
//  Created by Alex Lima Lopes Cancado on 10/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import Foundation
import UIKit

class MonsterImage: UIImageView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
    
    
    
    func playIdleAnimation(){
        self.image = UIImage(named: "idle1.png")
        self.animationImages = nil
        
        
        var imageArray = [UIImage]()
        
        for x in 1...4 {
            let img = UIImage(named: "idle\(x).png")
            imageArray.append(img!)
        }
        
        self.animationImages = imageArray
        self.animationDuration = 0.6
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    
    
    func playDeathAnimation(){
        
        self.animationImages = nil
        self.image = UIImage(named: "dead5.png")
        
        var imageArray = [UIImage]()
        
        for x in 1...5 {
            let img = UIImage(named: "dead\(x).png")
            imageArray.append(img!)
        }
        
        self.animationImages = imageArray
        self.animationDuration = 0.6
        self.animationRepeatCount = 1
        self.startAnimating()
    }
}