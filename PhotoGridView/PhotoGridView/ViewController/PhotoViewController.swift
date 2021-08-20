//
//  PhotoViewController.swift
//  PhotoGridView
//
//  Created by Archi Thakkar on 20/08/21.
//

import UIKit

class PhotoViewController: UIViewController {
    
    //MARK: - Variables -
    var selectedImage   : UIImage!
    var arrImages       : [Images] = []
    var selectedIndex   : Int!
    
    //MARK: - IBOutlets -
    @IBOutlet final private weak var imageView: UIImageView!
    
    //MARK: - Lifecycle method-
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    //MARK: - Helper method-
    private func prepareView() {
        imageView.image = selectedImage
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    //MARK: - Handle swipe gesture-
    @objc private func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if selectedIndex != arrImages.count - 1{
                    selectedImage = arrImages[selectedIndex+1].image
                    selectedIndex = selectedIndex+1
                }
                imageView.image = selectedImage
            case UISwipeGestureRecognizer.Direction.right:
                if selectedIndex != 0 {
                    selectedImage = arrImages[selectedIndex - 1].image
                    selectedIndex = selectedIndex-1
                }
                imageView.image = selectedImage
            default:
                break
            }
        }
    }
}
