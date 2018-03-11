//
//  AppDelegate.swift
//  CreateMapIndoor
//
//  Created by Miguel Crespo on 10/3/18.
//  Copyright © 2018 Wirex. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let locationBuilder = EILLocationBuilder()
        locationBuilder.setLocationName("Shop-test-3")
        
        let granate = "16149dcf8ddb2cbff7cb4b7d337c0032"
        let amarillo = "11f7db872eafaa8c1b70c8827169c624"
        let blanco = "c0fdcd379760e0dda5e0999e6a338d1a"
        let rosa = "eb9f78384df59b5b147f1a88f603223f"
        
        let x = 4.00
        let y = 6.00
        locationBuilder.setLocationBoundaryPoints([
            EILPoint(x: 0.00, y: 0.00),
            EILPoint(x: 0.00, y: y),
            EILPoint(x: x, y: y),
            EILPoint(x: x, y: 0.00)])
        
        locationBuilder.addBeacon(withIdentifier: granate, withPosition:  EILOrientedPoint.init(x: x, y: y))
        
        locationBuilder.addBeacon(withIdentifier: amarillo, withPosition:  EILOrientedPoint.init(x: 0.00, y: y))
        
        locationBuilder.addBeacon(withIdentifier: blanco, withPosition:  EILOrientedPoint.init(x: x, y: 0.00))
        
        locationBuilder.addBeacon(withIdentifier: rosa, withPosition:  EILOrientedPoint.init(x: 0.00, y: 0.00))
        
        let location = locationBuilder.build()
        ESTConfig.setupAppID("hackaton-59f", andAppToken: "95ebfc2422dea64a367c224a0cb31c2d")
        let addLocationRequest = EILRequestAddLocation(location: location!)
        addLocationRequest.sendRequest { (location, error) in
            if error != nil {
                NSLog("Error when saving location: \(error)")
            } else {
                NSLog("Location saved successfully: \(location?.identifier)")
            }
        }
        
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

