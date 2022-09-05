//
//  NaverOpenAPI.swift
//  NaverOpenAPITest
//
//  Created by Byeongjo Koo on 2022/09/01.
//

import Foundation

struct NaverOpenAPI: Fetchable {
    
    static let defaultHeader = [
        "X-Naver-Client-Id": "qlB1HcFJd3OzMSkIaZOr",
        "X-Naver-Client-Secret": "gwWu75hhTE",
    ]
    
    let scheme = Scheme.https
    let host = Host.naverOpenAPI
    let session = URLSession.shared
}

// MARK: - Path

extension NaverOpenAPI {
    
    enum Path: String {
        
        case typo = "/v1/search/errata.json"
        case movie = "/v1/search/movie.json"
    }
}

// MARK: - Typo

extension NaverOpenAPI {
    
    struct Typo: FetchableParameter {
        
        static let placeholder = Response(errata: "")
        
        let path = Path.typo.rawValue
        let httpMethod = HTTPMethod.get
        var data: Encodable?
        var headers: [String : String]? = defaultHeader
        
        init(keyword: String) {
            data = Parameter(query: keyword)
        }
        
        private struct Parameter: Encodable {
            
            let query: String
        }
        
        struct Response: Decodable {
            
            let errata: String
        }
    }
}

// MARK: - Movie

extension NaverOpenAPI {
    
    struct Movie: FetchableParameter {
        
        static let placeholder = Response(lastBuildDate: "", total: 0, start: 0, display: 0, items: [])
        
        let path = Path.movie.rawValue
        let httpMethod = HTTPMethod.get
        var data: Encodable?
        var headers: [String : String]? = defaultHeader
        
        init(keyword: String, genre: SearchForm.Genre) {
            data = Parameter(query: keyword, genre: genre.code)
        }
        
        private struct Parameter: Encodable {
            
            let query: String
            var genre: String?
        }
        
        struct Response: Decodable {
            
            let lastBuildDate: String
            let total: Int
            let start: Int
            let display: Int
            let items: [Item]
            
            struct Item: Codable {
                
                let title: String
                let link: String
                let image: String
                let subtitle: String
                let pubDate: String
                let director: String
                let actor: String
                let userRating: String
            }
        }
    }
}
