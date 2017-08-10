//
//  AppDelegate.swift
//  TweetViper
//
//  Created by Bao  Tran on 8/9/17.
//  Copyright © 2017 Bao Tran. All rights reserved.
//

import UIKit
import TwitterKit
import Cobra
import Gorgon

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Twitter.sharedInstance().start(withConsumerKey:"CIospbFooDSlL7vzy90wWDR0s", consumerSecret:"2RLLDNJ7IeDED8hrRxMwxlBO3Hehr8G6GtdepTIBNCDEtWRolG")
        
        //
        // STEP 1
        // Enabling debug logging for frameworks. You shouldn't enable logging in production
        //
        Gorgon.Log.enableDebugging = true
        Cobra.Log.enableDebugging = true
        
        //
        // STEP 2
        // Create a Cobra configuration for assembling the components and properties for the application
        //
        let config = Config(components: [
            Component<DaemonAssembly>(),
            Component<ServiceAssembly>()
            ], properties: [
                JsonProperty(name: "properties")
            ])
        
        //
        // STEP 3
        // Provide the configuration to the Cobra application
        //
        try! App.sharedInstance.config(config)
//
//        //
//        // STEP 4
//        // Register Feature to Module proxies for the Cobra application routes
//        //
        App.sharedInstance.registerProxies([
            Proxy<FeedFeatureType>(modules: Module<FeedAssembly>())
            ])
//
//        //
//        // STEP 5
//        // Route to our first feature in our application window
//        //
        try! App.sharedInstance.feature(FeedFeatureType.self).showInWindow(window!)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

