//
//  AlbumCollectionViewController.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation
import UIKit

class AlbumCollectionViewController: UICollectionViewController {
    var albums = [Album]()
    
    var selectedIndex: Int? = nil
    var username: String? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if username == nil {
            self.performSegue(withIdentifier: "changeUsername", sender: self)
        } else {
            self.reload()
        }
    }
    
    func reload() {
        if let username = self.username {
            self.title = "\(username)'s Albums"
            self.albums = [Album]()
            self.collectionView.reloadData()
            
            ImgurRepository().getAlbums(username: username, success: { (albums) in
                DispatchQueue.main.async { [weak self] in
                    self?.albums = albums
                    self?.collectionView.reloadData()
                }
            }) { (error) in
                print(error)
            }
        } else {
            self.title = nil
            self.albums = [Album]()
            self.collectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "albumImages",
            let selectedIndex = self.selectedIndex {
            let album = self.albums[selectedIndex]
            let dest = segue.destination as! AlbumImagesCollectionViewController
            dest.album = album
        } else if segue.identifier == "changeUsername" {
            let dest = segue.destination as! ChangeUsernameViewController
            dest.delegate = self
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.item
        self.performSegue(withIdentifier: "albumImages", sender: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath) as! AlbumCollectionViewCell
        cell.album = self.albums[indexPath.item]
        return cell
    }
}

extension AlbumCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //two albums per row with 8 margin on sides and in middle
        let width = (UIScreen.main.bounds.width - 24) * 0.5
        let height = width * 1.3
        return CGSize(width: width, height: height)
    }
}

extension AlbumCollectionViewController: ChangeUsernameViewControllerDelegate {
    func usernameChanged(username: String?) {
        self.username = username
        self.reload()
    }
}
