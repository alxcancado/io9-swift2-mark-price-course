//
//  ImageSoundViewController.swift
//  Animal Sounds
//
//  Created by Alex Lima Lopes Cancado on 20/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit

class ImageSoundViewController: UIViewController {

    @IBOutlet weak var animalImageButton: UIButton!
    var imagePath = ""
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(animalPath: String?){
        self.init(nibName: "ImageSoundViewController", bundle: nil)
        imagePath = animalPath!
        
        
        
//        if UIImage(named: animalPath) != nil {
//            animalImageButton?.setImage(UIImage(named: animalPath), forState: UIControlState.Normal)
//        }

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
            if let image = UIImage(named: imagePath) {
                animalImageButton.setImage(image, forState: .Normal)
            }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func loadPreviousVC(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
