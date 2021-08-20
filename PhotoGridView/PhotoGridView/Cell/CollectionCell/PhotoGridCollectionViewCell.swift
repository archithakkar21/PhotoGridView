//
//  PhotoGridCollectionViewCell.swift
//  PhotoGridView
//
//  Created by Archi Thakkar on 20/08/21.
//

import UIKit

class PhotoGridCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Variable-
    var imgUrl: String! {
        didSet {
            imgView.downloaded(from: imgUrl)
        }
    }
    
    //MARK: - IBOutlets-
    @IBOutlet final private weak var imgView: UIImageView!
    
    //MARK: - Lifecycle methods-
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
