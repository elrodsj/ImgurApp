//
//  BuildConfiguration.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation

struct BuildConfiguration {
    private init() {}
    
    private static var buildConfiguration: [String: String] {
        return Bundle.main.infoDictionary!["BuildConfiguration"]! as! [String: String]
    }
    
    static var imgurApiBaseUrl: URL {
        return URL(string: BuildConfiguration.buildConfiguration["IMGUR_API_BASE_URL"]!)!
    }
    
    static var imgurApiClientId: String {
        return BuildConfiguration.buildConfiguration["IMGUR_API_CLIENT_ID"]!
    }
}
