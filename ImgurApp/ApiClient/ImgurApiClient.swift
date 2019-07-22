//
//  ImgurApiClient.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation

struct ImgurApiClient {
    private(set) var baseUrl = BuildConfiguration.imgurApiBaseUrl
    private var clientId = BuildConfiguration.imgurApiClientId
    
    //may want to customize this later for shorter timeouts and security.
    private var urlSession = URLSession.shared
    
    enum ImgurApiClientError: Error {
        case invalidResponse(statusCode: Int)
        case noData
    }
    
    //made a generic func that get/post/put/etc can all rely on later
    func request<ResponseType: Decodable>(request: URLRequest, success: @escaping (ResponseType) -> Void, failure: @escaping (Error) -> Void) {
        //handle auth here
        var request = request
        request.addValue("Client-ID \(self.clientId)", forHTTPHeaderField: "Authorization")
        
        self.urlSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                failure(error)
            } else if let httpResponse = response as? HTTPURLResponse {
                if 200..<300 ~= httpResponse.statusCode {
                    if let data = data {
                        do {
                            let responseEntity = try JSONDecoder().decode(ResponseType.self, from: data)
                            success(responseEntity)
                        } catch let error {
                            failure(error)
                        }
                    } else {
                        failure(ImgurApiClientError.noData)
                    }
                } else {
                    failure(ImgurApiClientError.invalidResponse(statusCode: httpResponse.statusCode))
                }
            }
        }.resume()
    }
    
    func get<ResponseType: Decodable>(url: URL, success: @escaping (ResponseType) -> Void, failure: @escaping (Error) -> Void) {
        let request = URLRequest(url: url)
        self.request(request: request, success: success, failure: failure)
    }
}
