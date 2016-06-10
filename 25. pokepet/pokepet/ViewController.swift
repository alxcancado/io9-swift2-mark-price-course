//
//  ViewController.swift
//  pokepet
//
//  Created by Alex Lima Lopes Cancado on 10/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImage: MonsterImage!
    @IBOutlet weak var foodImage: DragImage!
    @IBOutlet weak var heartImage: DragImage!
    @IBOutlet weak var skull1: UIImageView!
    @IBOutlet weak var skull2: UIImageView!
    @IBOutlet weak var skull3: UIImageView!
    
    let DIM_APLHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALTIES = 3
    
    var penalties = 0
    var timer: NSTimer!
    
    var monsterHappy = false
    var currentItem: UInt32 = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImage.dropTarget = monsterImage
        heartImage.dropTarget = monsterImage
        skull1.alpha = DIM_APLHA
        skull2.alpha = DIM_APLHA
        skull3.alpha = DIM_APLHA
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnCharacter:", name: "onTargetDropped", object: nil)
        
        startTimer()
    }
    
    func itemDroppedOnCharacter(notif: AnyObject){
        //print("ITEM DROPPED ON CHARACTER")
        monsterHappy = true
        startTimer()
        
        foodImage.alpha = DIM_APLHA
        foodImage.userInteractionEnabled = false
        heartImage.alpha = DIM_APLHA
        heartImage.userInteractionEnabled = false
        
    }
    
    func startTimer(){
        // if a  timer already exists, we need to finish this timer beforre start a new one. it's a good practice
        if timer != nil {
            timer.invalidate()
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "changeGameState", userInfo: nil, repeats: true)
    }
    
    func changeGameState(){
        
        if !monsterHappy {
            
            penalties += 1
            
            if penalties == 1 {
                skull1.alpha = OPAQUE
            } else if penalties == 2 {
                skull2.alpha = OPAQUE
            } else if penalties == 3 {
                skull3.alpha = OPAQUE
            } else {
                skull1.alpha = DIM_APLHA
                skull2.alpha = DIM_APLHA
                skull3.alpha = DIM_APLHA
            }
            
            if penalties >= MAX_PENALTIES {
                gameOver()
            }
        }
        
        let random = arc4random_uniform(2) // 0 or 1
        
        if random == 0 {
            foodImage.alpha = DIM_APLHA
            foodImage.userInteractionEnabled = false
            
            heartImage.alpha = OPAQUE
            heartImage.userInteractionEnabled = true
        } else {
            heartImage.alpha = DIM_APLHA
            heartImage.userInteractionEnabled = false
            
            foodImage.alpha = OPAQUE
            foodImage.userInteractionEnabled = true
        }
        
        currentItem = random
        monsterHappy = false
        
    }
    
    func gameOver(){
        if timer != nil {
            timer.invalidate()
        }
        monsterImage.playDeathAnimation()
    }

}

