//
//  ImgurRepository.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation

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
}
