//
//  PhotoViewController.swift
//  PhotoGridView
//
//  Created by Archi Thakkar on 20/08/21.
//

import UIKit

protocol  DismissDelegate {
    func dismissView()
}
class PhotoViewController: UIViewController {
    
    //MARK: - Variables -
    var selectedImage   : String!
    var arrImages       : NSArray = []
    var selectedIndex   : Int!
    var delegate : DismissDelegate!
    
    //MARK: - IBOutlets -
    @IBOutlet final private weak var btnDismiss : UIButton!
    @IBOutlet final private weak var imageView  : UIImageView!
    
    //MARK: - Lifecycle method-
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    //MARK: - Helper method-
    private func prepareView() {
        imageView.downloaded(from: selectedImage)
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
                    selectedImage = (arrImages[selectedIndex+1] as? [String:Any])?["url"] as? String
                    selectedIndex = selectedIndex+1
                }
                imageView.downloaded(from: selectedImage)
            case UISwipeGestureRecognizer.Direction.right:
                if selectedIndex != 0 {
                    selectedImage = (arrImages[selectedIndex-1] as? [String:Any])?["url"] as? String
                    selectedIndex = selectedIndex-1
                }
                imageView.downloaded(from: selectedImage)
            default:
                break
            }
        }
    }
    
    //MARK: - IBActions
    @IBAction private func didTapOnDismissBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: { 
            self.delegate.dismissView()
        })
    }
}
