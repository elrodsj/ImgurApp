//
//  AlbumImagesCollectionViewController.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation
import UIKit

class AlbumImagesCollectionViewController: UICollectionViewController {
    var album: Album? = nil
    
    var images = [Image]()
    
    override func viewDidLoad() {
        if let album = self.album {
            ImgurRepository().getAlbumImages(albumHash: album.id, success: { (images) in
                DispatchQueue.main.async { [weak self] in
                    self?.images = images
                    self?.collectionView.reloadData()
                }
            }) { (error) in
                print(error)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! AlbumImageCollectionViewCell
        cell.image = self.images[indexPath.item]
        return cell
    }
}

extension AlbumImagesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //two albums per row with 8 margin on sides and in middle
        let width = (UIScreen.main.bounds.width - 24) * 0.5 - 10
        let height = width * 1.3
        return CGSize(width: width, height: height)
    }
}
