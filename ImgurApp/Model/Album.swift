//
//  Album.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation

struct Album {
    let id: String
    let title: String?
    let coverId: String?
    
    init(apiAlbum: GETAlbumsResponse.GETAlbumsResponse_Album) {
        self.id = apiAlbum.id
        self.title = apiAlbum.title
        self.coverId = apiAlbum.cover
    }
}
