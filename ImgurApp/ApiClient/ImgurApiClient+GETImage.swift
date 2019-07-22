//
//  ImgurApiClient+GETImage.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation

extension ImgurApiClient {
    func getImage(imageHash: String, success: @escaping (GETImageResponse) -> Void, failure: @escaping (Error) -> Void) {
        let url = self.baseUrl.appendingPathComponent("image").appendingPathComponent(imageHash)
        self.get(url: url, success: success, failure: failure)
    }
}

struct GETImageResponse: Decodable {
    let data: GETImageResponse_Data
    
    struct GETImageResponse_Data: Decodable {
        let id: String
        let link: String
    }
}
