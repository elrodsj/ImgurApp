//
//  AlbumImageCollectionViewCell.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation
import UIKit

class AlbumImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: Image! {
        didSet {
            self.imageView.pin_setImage(from: self.image.url)
        }
    }
}
