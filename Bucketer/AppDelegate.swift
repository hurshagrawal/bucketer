//  AppDelegate.swift
//  Copyright © 2018 Hursh Agrawal. All rights reserved.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.main.bounds)
    let viewController = WebViewController()
    self.window?.rootViewController = viewController
    self.window?.makeKeyAndVisible()

    return true
  }
}

