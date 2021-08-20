//
//  PhotoGridViewController.swift
//  PhotoGridView
//
//  Created by Archi Thakkar on 20/08/21.
//

import UIKit
import SwiftyJSON
import Alamofire


class PhotoGridViewController: UIViewController {
    
    //MARK: - Variables-
    var arrayPost : NSArray = []
    var isAPILoading       = false
    
    //MARK:- IBOutlets-
    @IBOutlet final private weak var gridCollectionView: UICollectionView!
    
    //MARK: - Lifecycle methods-
    override func viewDidLoad() {
        super.viewDidLoad()
        callWebservice()
    }
    
    //MARK:- Helper Method-
    private func prepareView() {
        self.navigationItem.title = Key.kGridView
        self.navigationItem.backButtonTitle = Key.kBackTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.gridCollectionView.register(UINib(nibName: Key.kPhotoGridCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Key.kPhotoGridCollectionViewCell)
    }
}

// MARK: - Webservice Method
extension PhotoGridViewController {
   
    private func callWebservice() {
        var url:String!
        url = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&count=42"

        Alamofire.AF.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result{
                    case .success(let json):
                        print(json)
                        DispatchQueue.main.async {
                           print(json)
                            self.arrayPost = (json as? NSArray)!
                            self.prepareView()
                           self.gridCollectionView.reloadData()
                    
                        }
                    case .failure(let error):
                        print(error)
                    }
            }
    }
}

//MARK: - UICollectionView Delegate & Datasource method -
extension PhotoGridViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayPost.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gridCollectionView.dequeueReusableCell(withReuseIdentifier: Key.kPhotoGridCollectionViewCell, for: indexPath) as! PhotoGridCollectionViewCell
        if let obj = arrayPost[indexPath.row] as? [String:Any] {
            cell.imgUrl = obj["url"] as? String
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.view.alpha = 0.5
        let vc = UIStoryboard.main.get(PhotoViewController.self)
        vc?.selectedImage = (arrayPost[indexPath.row] as? [String:Any])?["url"] as? String
        vc?.arrImages = arrayPost
        vc?.selectedIndex = indexPath.row
        vc?.modalPresentationStyle = .pageSheet
        vc?.delegate = self
        self.navigationController?.present(vc!, animated: true, completion: nil)
    }
}

//MARK: - UICollectionView DelegateFlowLayout method -
extension PhotoGridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth/3.05, height: screenWidth/3.05)
    }
}

//MARK: - Dismiss popup delegate
extension PhotoGridViewController: DismissDelegate {
    func dismissView() {
        view.alpha = 1
    }
}
