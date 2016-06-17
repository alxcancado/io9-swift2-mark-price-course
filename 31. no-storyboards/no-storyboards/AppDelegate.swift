//
//  AppDelegate.swift
//  no-storyboards
//
//  Created by Alex Lima Lopes Cancado on 16/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // No Storyboard Step-by-step
        //
        // delete the storyboard
        // edit the plist file and delete the main storyboard reference
        // create a new viewcontroller: UIViewController, init (look the YellowViewController for reference)
        // create a new XIB file: new > user interface > empty. give the name of the view controller associated to easy remember
        // click in the new XIB file, click in the square icon "file's owner", go to custom class tab then select/write your customized ViewController class
        // create a UIView in the XIB file
        // connect the file's owner to this view (control + click the drag to the view) and select the "view" outlet
        //
        // 1. we got a window: create a window
        // 2. create a view controller var and init the custom view controller
        // 3. set the window view controller
        // 4. show the app
        
        //YellowViewController = YellowViewController()
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds) // 1. we got a window: create a window
        let yellowViewController = YellowViewController(nibName: "YellowViewController", bundle: nil) // 2. we got a VC
        window?.rootViewController = yellowViewController // because we need a window to show the app
        window?.makeKeyAndVisible() // hey, show the app
        
        
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

