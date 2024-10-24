//
//  AppDelegate.swift
//  Simple Calculator
//
//  Created by Samandar on 24/10/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = CalculatorSelectionVC() // Set our ViewController as root
        window?.makeKeyAndVisible()
        return true
    }
}
