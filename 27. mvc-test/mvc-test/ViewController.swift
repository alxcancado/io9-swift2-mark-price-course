//
//  ViewController.swift
//  mvc-test
//
//  Created by Mark Price on 8/26/15.
//  Copyright © 2015 devslopes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var renameField: UITextField!
    @IBOutlet weak var fullName: UILabel!
    
    let person = Person(first: "John", last: "Hancock")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullName.text = person.fullName  
    }
 
    @IBAction func btnPressed(sender: AnyObject) {
        
        if let txt = renameField.text {
            person.firstName = txt
            fullName.text = person.fullName
        }
    }

}

