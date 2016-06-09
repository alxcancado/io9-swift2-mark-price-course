//
//  ViewController.swift
//  pokepet
//
//  Created by Alex Lima Lopes Cancado on 10/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imageArray = [UIImage]()
        
        for x in 1...4 {
            let img = UIImage(named: "idle\(x).png")
            imageArray.append(img!)
        }
        
        monsterImage.animationImages = imageArray
        monsterImage.animationDuration = 0.6
        monsterImage.animationRepeatCount = 0
        monsterImage.startAnimating()
        
    
    }


}

