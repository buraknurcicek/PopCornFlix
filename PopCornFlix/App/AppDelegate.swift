//
//  AppDelegate.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 6.02.2021.
//

import UIKit

@UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = MovieWireframe().viewController
        self.window?.makeKeyAndVisible()
        
        return true
    }

}
