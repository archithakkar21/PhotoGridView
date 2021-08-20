//
//  PhotoGridViewController.swift
//  PhotoGridView
//
//  Created by Archi Thakkar on 20/08/21.
//

import UIKit

class PhotoGridViewController: UIViewController {
    
    //MARK: - Variables-
    var arrImages: [Images] = []
    
    //MARK:- IBOutlets-
    @IBOutlet final private weak var gridCollectionView: UICollectionView!
    
    //MARK: - Lifecycle methods-
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    //MARK:- Helper Method-
    private func prepareView() {
        self.navigationItem.title = Key.kGridView
        self.navigationItem.backButtonTitle = Key.kBackTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.gridCollectionView.register(UINib(nibName: Key.kPhotoGridCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Key.kPhotoGridCollectionViewCell)
    }
}

//MARK: - UICollectionView Delegate & Datasource method -
extension PhotoGridViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gridCollectionView.dequeueReusableCell(withReuseIdentifier: Key.kPhotoGridCollectionViewCell, for: indexPath) as! PhotoGridCollectionViewCell
        cell.imgData = arrImages[indexPath.row].image
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.main.get(PhotoViewController.self)
        vc?.selectedImage = arrImages[indexPath.row].image
        vc?.arrImages = arrImages
        vc?.selectedIndex = indexPath.row
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

//MARK: - UICollectionView DelegateFlowLayout method -
extension PhotoGridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth/3.05, height: screenWidth/3.05)
    }
}
