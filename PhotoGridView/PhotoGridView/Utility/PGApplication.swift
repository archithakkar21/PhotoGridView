//
//  PGApplication.swift
//  PhotoGridView
//
//  Created by Archi Thakkar on 20/08/21.
//

import UIKit



class PGApplication {
    
    //MARK: - Variables
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let shared = PGApplication()
    
    //MARK: - Prepare navigation 
    func prepareNavigation() {
        PGApplication.appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        let photoGridVC = UIStoryboard.main.get(PhotoGridViewController.self)!
        photoGridVC.arrImages = ImageData.getImageData()
        let navigationVC = UINavigationController(rootViewController: photoGridVC)
        PGApplication.appDelegate.window?.rootViewController = navigationVC
        PGApplication.appDelegate.window?.makeKeyAndVisible()
    }
}
