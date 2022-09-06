//
//  APIConstants.swift
//  NetworkModule
//
//  Created by changgyo seo on 2022/08/30.
//

import Foundation

struct NaverOpenAPI {
    
    static let baseURL = "https://openapi.naver.com/v1"
    static let searchURL = baseURL + "/search"
    static let movieJsonURL = searchURL + "/movie.json"
    static let ClientID = "SjK7VjRrkujvwETKupas"
    static let ClientSecret = "u77U1Pv2Vt"
    static let header =
    [
        "X-Naver-Client-Id" : ClientID,
        "X-Naver-Client-Secret" : ClientSecret
    ]
}

struct NaverOpneAPICommonResponse<T: Codable>: Codable {
    
    let lastBuildDate: String
    let total: Int
    let start: Int
    let display: Int
    let items: [T]
}
