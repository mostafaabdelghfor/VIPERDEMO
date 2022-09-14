//
//  AppDelegate.swift
//  VIPERDemo
//
//  Created by Mustafa Ahmed on 12/09/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window:UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
      
        window?.rootViewController =   UINavigationController(rootViewController: MedicationRouter.createModule())
        window?.makeKeyAndVisible()
        return true
    }
  
}

