//
//  postCollectionViewCell.swift
//  InterlaceCodingTest
//
//  Created by Afnan Mirza on 8/2/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit
import SDWebImage
import FLAnimatedImage

class postCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imgView: FLAnimatedImageView!
    
    func configureCell(data: GiphyPost) {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2.5
        
        if let image = data.image, let imageURL = URL(string: image) {
            self.imgView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "loading"))
        }
    }
}
