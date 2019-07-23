//
//  ImgurRepository.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation

//this layer is here in case further abstraction between the api client and the ui is needed. if further caching or storage of the data needed to take place, it would happen here.
struct ImgurRepository {
    
    let apiClient = ImgurApiClient()
    
    func getAlbums(username: String, success: @escaping ([Album]) -> Void, failure: @escaping (Error) -> Void) {
        self.apiClient.getAlbums(username: username, success: { (response) in
            success(response.data.map({ Album(apiAlbum: $0) }))
        }, failure: failure)
    }
    
    func getImage(imageHash: String, success: @escaping (Image) -> Void, failure: @escaping (Error) -> Void) {
        self.apiClient.getImage(imageHash: imageHash, success: { (response) in
            do {
                let image = try Image(apiImage: response)
                success(image)
            } catch let error {
                failure(error)
            }
        }, failure: failure)
    }
    
    func getAlbumImages(albumHash: String, success: @escaping ([Image]) -> Void, failure: @escaping (Error) -> Void) {
        self.apiClient.getAlbumImages(albumHash: albumHash, success: { (response) in
            do {
                let images = try response.data.map({ try Image(apiImage: $0) })
                success(images)
            } catch let error {
                failure(error)
            }
        }, failure: failure)
    }
}
