//
//  GameViewController.swift
//  Animal Sounds
//
//  Created by Alex Lima Lopes Cancado on 18/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var imageSoundVC = ImageSoundViewController()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadImageSoundView(sender: AnyObject!){
        //imageSoundVC = ImageSoundViewController(nibName: "ImageSoundViewController", bundle: nil)
        // its initialised already by the BlueViewController itself, so
        
        if sender.tag == 1 {
            imageSoundVC = ImageSoundViewController(animalPath: "cow1.jpg")
        } else if sender.tag == 2 {
            imageSoundVC = ImageSoundViewController(animalPath: "cow2.jpg")
        } 
        
        self.presentViewController(imageSoundVC, animated: true, completion: nil)
        
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
