//
//  ImgurApiClient+GETAlbumImages.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation

extension ImgurApiClient {
    func getAlbumImages(albumHash: String, success: @escaping (GETAlbumImagesResponse) -> Void, failure: @escaping (Error) -> Void) {
        let url = self.baseUrl.appendingPathComponent("album").appendingPathComponent(albumHash).appendingPathComponent("images")
        self.get(url: url, success: success, failure: failure)
    }
}

struct GETAlbumImagesResponse: Decodable {
    let data: [GETAlbumImagesResponse_Image]
    
    struct GETAlbumImagesResponse_Image: Decodable {
        let id: String
        let link: String
    }
}
