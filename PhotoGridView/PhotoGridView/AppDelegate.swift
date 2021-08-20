//
//  AppDelegate.swift
//  PhotoGridView
//
//  Created by Archi Thakkar on 20/08/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainNavController : UINavigationController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //Prepare navigation
        PGApplication.shared.prepareNavigation()
        return true
    }
}

