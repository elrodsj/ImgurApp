//
//  ImgurApiClient+GETAlbums.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation

extension ImgurApiClient {
    func getAlbums(username: String, success: @escaping (GETAlbumsResponse) -> Void, failure: @escaping (Error) -> Void) {
        let url = self.baseUrl.appendingPathComponent("account").appendingPathComponent(username).appendingPathComponent("albums")
        self.get(url: url, success: success, failure: failure)
    }
}

struct GETAlbumsResponse: Decodable {
    let data: [GETAlbumsResponse_Album]
    
    struct GETAlbumsResponse_Album: Decodable {
        let id: String
        let title: String?
        let cover: String?
    }
}
