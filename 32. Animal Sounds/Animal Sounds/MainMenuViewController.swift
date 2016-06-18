//
//  ViewController.swift
//  Animal Sounds
//
//  Created by Alex Lima Lopes Cancado on 18/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    //reference to the BlueViewController
    //var gameVC = GameViewController()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //
    @IBAction func loadGameView(sender: AnyObject){
        
        //blueVC = BlueViewController(nibName: "BlueViewController", bundle: nil)
        // its initialised already by the BlueViewController itself, so
        //blueVC = BlueViewController(printMe: "string passed from Yeallow to Blue")
        //self.presentViewController(blueVC, animated: true, completion: nil)
        
    }
    //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

