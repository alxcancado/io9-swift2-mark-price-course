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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImage.dropTarget = monsterImage
        heartImage.dropTarget = monsterImage
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnCharacter:", name: "onTargetDropped", object: nil)
    }
    
    func itemDroppedOnCharacter(notif: AnyObject){
        print("ITEM DROPPED ON CHARACTER")
    }

}

