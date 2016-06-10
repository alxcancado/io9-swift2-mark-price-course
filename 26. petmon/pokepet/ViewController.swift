//
//  ViewController.swift
//  pokepet
//
//  Created by Alex Lima Lopes Cancado on 10/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit
import AVFoundation

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
    
    var musicPlayer: AVAudioPlayer!
    var sfxBite: AVAudioPlayer!
    var sfxHeart: AVAudioPlayer!
    var sfxDeath: AVAudioPlayer!
    var sfxSkull: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGame()
    }
    
    func initGame() {
        foodImage.dropTarget = monsterImage
        heartImage.dropTarget = monsterImage
        skull1.alpha = DIM_APLHA
        skull2.alpha = DIM_APLHA
        skull3.alpha = DIM_APLHA
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnCharacter:", name: "onTargetDropped", object: nil)
        
        do {
            let resourcePath = NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")
            let url = NSURL(fileURLWithPath: resourcePath!)
            try musicPlayer = AVAudioPlayer(contentsOfURL: url)
            
            try musicPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")!))
            
            try sfxBite = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
            
            try sfxHeart = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
            
            try sfxDeath = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
            
            try sfxSkull = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
            
            musicPlayer.prepareToPlay()
            musicPlayer.play()
            
            sfxBite.prepareToPlay()
            sfxHeart.prepareToPlay()
            sfxDeath.prepareToPlay()
            sfxSkull.prepareToPlay()
            
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
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
        
        if currentItem == 0 {
            sfxHeart.play()
        } else {
            sfxBite.play()
        }
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
            sfxSkull.play()
            
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
        sfxDeath.play()
    }

}

