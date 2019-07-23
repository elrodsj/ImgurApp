//
//  MainCollectionViewCell.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation
import UIKit
import PINRemoteImage

class MainCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var albumCoverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var album: Album! {
        didSet {
            self.titleLabel.text = self.album.title
            if let coverId = self.album.coverId {
                ImgurRepository().getImage(imageHash: coverId, success: { [weak self] (image) in
                    self?.albumCoverImageView.pin_setImage(from: image.url)
                }) { (error) in
                    print(error)
                }
            } else {
                self.albumCoverImageView.image = nil
            }
        }
    }
}
