//
//  UIStoryboard+Extension.swift
//  PhotoGridView
//
//  Created by Archi Thakkar on 20/08/21.
//

import UIKit

extension UIStoryboard {
    static var main: UIStoryboard = {
        let storyboard = UIStoryboard.storyboard(name: "Main")
        return storyboard
    }()
    
    // to get particular storyboard name.
    class func storyboard(name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: Bundle.main)
    }
    
    public func get<T:UIViewController>(_ identifier: T.Type) -> T? {
        let storyboardID = String(describing: identifier)
        guard let viewController = instantiateViewController(withIdentifier: storyboardID) as? T else {
            return nil
        }
        return viewController
    }
}
