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
    var selectedIndex: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.album?.title
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "image",
            let selectedIndex = self.selectedIndex {
            let image = self.images[selectedIndex]
            let dest = segue.destination as? ImageViewController
            dest?.image = image
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.item
        self.performSegue(withIdentifier: "image", sender: self)
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
        //two albums per row with 2 margin on sides and in middle
        let width = (UIScreen.main.bounds.width - 6) * 0.5
        let height = width
        return CGSize(width: width, height: height)
    }
}
