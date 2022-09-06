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
        
        static let placeholder = Response(correction: "")
        
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
            
            let correction: String
            
            enum CodingKeys: String, CodingKey {
                case correction = "errata"
            }
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
            data = Parameter(keyword: keyword, genre: genre.code)
        }
        
        private struct Parameter: Encodable {
            
            let keyword: String
            var genre: String?
            
            enum CodingKeys: String, CodingKey {
                
                case keyword = "query"
                case genre
            }
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
                let thumbnail: String
                let subtitle: String
                let releaseDate: String
                let director: String
                let actors: String
                let userRating: String
                
                enum CodingKeys: String, CodingKey {
                    
                    case title, link, subtitle, director, userRating
                    case thumbnail = "image"
                    case releaseDate = "pubDate"
                    case actors = "actor"
                }
            }
        }
    }
}
