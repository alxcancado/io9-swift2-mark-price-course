//
//  BlueViewController.swift
//  no-storyboards
//
//  Created by Alex Lima Lopes Cancado on 18/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    
    
    
    // *********************************************
    @IBOutlet weak var printLabel: UILabel!
    var printText = ""
    
    convenience init(printMe: String){
        self.init(nibName: "BlueViewController", bundle: nil)
        printText = printMe
    }
    

    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        printLabel.text = printText
    }
    // *******************************************************
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
