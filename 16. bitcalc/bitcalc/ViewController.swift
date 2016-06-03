//
//  ViewController.swift
//  bitcalc
//
//  Created by Alex Lima Lopes Cancado on 3/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var bitSound: AVAudioPlayer!
    
    @IBOutlet weak var outputScreen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try bitSound = AVAudioPlayer(contentsOfURL: soundUrl)
            bitSound.prepareToPlay()
        } catch let err as NSError {
            print((err.debugDescription))
        }
        
        
    }
    
    @IBAction func numberPressed(button: UIButton!){
        
        bitSound.play()
        
    }


}

