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
    @IBOutlet weak var potionImage:DragImage!
    @IBOutlet weak var shadowImage: UIImageView!
    @IBOutlet weak var restartButton: UIButton!
    
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
    var sfxPotion: AVAudioPlayer!
    var gameOverMusic: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGame()
        
    }
    
    func initGame() {
        foodImage.dropTarget = monsterImage
        heartImage.dropTarget = monsterImage
        potionImage.dropTarget = monsterImage
        
        skull1.alpha = DIM_APLHA
        skull2.alpha = DIM_APLHA
        skull3.alpha = DIM_APLHA
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDroppedOnCharacter(_:)), name: "onTargetDropped", object: nil)
        
        do {
            let resourcePath = NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")
            let url = NSURL(fileURLWithPath: resourcePath!)
            try musicPlayer = AVAudioPlayer(contentsOfURL: url)
            
            try gameOverMusic = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("game_over", ofType: "mp3")!))
            
            try sfxBite = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
            
            try sfxHeart = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
            
            try sfxDeath = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
            
            try sfxSkull = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
            
            try sfxPotion = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bottle", ofType: "wav")!))
            
            musicPlayer.prepareToPlay()
            musicPlayer.play()
            
            sfxBite.prepareToPlay()
            sfxHeart.prepareToPlay()
            sfxDeath.prepareToPlay()
            sfxSkull.prepareToPlay()
            sfxPotion.prepareToPlay()
            gameOverMusic.prepareToPlay()
            
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
        potionImage.alpha = DIM_APLHA
        potionImage.userInteractionEnabled = false
        
        if currentItem == 0 {
            sfxHeart.play()
        } else if currentItem == 1{
            sfxBite.play()
        } else {
            sfxPotion.play()
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
        
        let random = arc4random_uniform(3) // 0 or 1
        
        if random == 0 {
            foodImage.alpha = DIM_APLHA
            foodImage.userInteractionEnabled = false
            
            heartImage.alpha = OPAQUE
            heartImage.userInteractionEnabled = true
            
            potionImage.alpha = DIM_APLHA
            potionImage.userInteractionEnabled = false
            
        } else if random == 1 {
            foodImage.alpha = OPAQUE
            foodImage.userInteractionEnabled = true
            
            heartImage.alpha = DIM_APLHA
            heartImage.userInteractionEnabled = false
            
            potionImage.alpha = DIM_APLHA
            potionImage.userInteractionEnabled = false
        } else {
            foodImage.alpha = DIM_APLHA
            foodImage.userInteractionEnabled = false
            
            heartImage.alpha = DIM_APLHA
            heartImage.userInteractionEnabled = false
            
            potionImage.alpha = OPAQUE
            potionImage.userInteractionEnabled = true
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
        musicPlayer.stop()
        gameOverMusic.play()
        shadowImage.hidden = false
        restartButton.hidden = false
    }
    
    @IBAction func onRestartPressed(){
        shadowImage.hidden = true
        restartButton.hidden = true
        musicPlayer.stop()
        gameOverMusic.stop()
        penalties = 0
        monsterImage.playIdleAnimation()
        initGame()
        
    }
    
}

