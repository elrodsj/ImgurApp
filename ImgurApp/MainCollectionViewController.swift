//
//  MainCollectionViewController.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation
import UIKit

class MainCollectionViewController: UICollectionViewController {
    var albums = [Album]()
    
    override func viewDidLoad() {
        ImgurRepository().getAlbums(username: "abc123", success: { (albums) in
            DispatchQueue.main.async { [weak self] in
                self?.albums = albums
                self?.collectionView.reloadData()
            }
        }) { (error) in
            print(error)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath) as! MainCollectionViewCell
        cell.album = self.albums[indexPath.item]
        return cell
    }
}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //two albums per row with 8 margin on sides and in middle
        let width = (UIScreen.main.bounds.width - 24) * 0.5 - 10
        let height = width * 1.3
        return CGSize(width: width, height: height)
    }
}
