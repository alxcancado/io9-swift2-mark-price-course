//
//  ViewController.swift
//  RedBlueBirds
//
//  Created by Alex Lima Lopes Cancado on 5/10/15.
//  Copyright © 2015 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var BluButton: UIButton!
    @IBOutlet weak var BlueBird: UIImageView!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var redBird: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hideBlue(sender: AnyObject) {
        BlueBird.hidden = true
        redBird.hidden = false
    }
   
    @IBAction func hideRed(sender: AnyObject) {
        redBird.hidden = true
        BlueBird.hidden = false
    }
    
}
