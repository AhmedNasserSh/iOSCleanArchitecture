//
//  ImageCollectionViewCell.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/6/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import UIKit
import SDWebImage
class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var searchImageView: UIImageView!
    func setImage(photo:PhotoEntity?){
        self.searchImageView.sd_setImage(with: photo?.getImageURL(), completed: nil)
    }
}
