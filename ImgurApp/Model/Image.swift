//
//  Image.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation

struct Image {
    let id: String
    let url: URL
    
    enum ImageError: Error {
        case invalidUrl
    }
    
    init(apiImage: GETImageResponse) throws {
        self.id = apiImage.data.id
        
        guard let url = URL(string: apiImage.data.link) else {
            throw ImageError.invalidUrl
        }
        
        self.url = url
    }
    
    init(apiImage: GETAlbumImagesResponse.GETAlbumImagesResponse_Image) throws {
        self.id = apiImage.id
        
        guard let url = URL(string: apiImage.link) else {
            throw ImageError.invalidUrl
        }
        
        self.url = url
    }
}
