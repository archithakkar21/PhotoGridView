//
//  ImageData.swift
//  PhotoGridView
//
//  Created by Archi Thakkar on 20/08/21.
//

import UIKit

class ImageData {
    class func getImageData() -> [Images]{
        var arrImages : [Images] = []
        arrImages.append(Images(imgName: "Image1", image: UIImage(named: "image1") ?? UIImage()))
        arrImages.append(Images(imgName: "Image2", image: UIImage(named: "image2") ?? UIImage()))
        arrImages.append(Images(imgName: "Image3", image: UIImage(named: "image3") ?? UIImage()))
        arrImages.append(Images(imgName: "Image4", image: UIImage(named: "image4") ?? UIImage()))
        arrImages.append(Images(imgName: "Image5", image: UIImage(named: "image5") ?? UIImage()))
        arrImages.append(contentsOf: arrImages)
        arrImages.append(contentsOf: arrImages)
        arrImages.append(contentsOf: arrImages)
        arrImages.append(contentsOf: arrImages)
        return arrImages
    }
}
