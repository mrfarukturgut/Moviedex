//
//  AppDelegate.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let controller = ListViewController()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        window.rootViewController = controller
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
    
}
