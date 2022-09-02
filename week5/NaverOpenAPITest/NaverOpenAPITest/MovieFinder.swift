//
//  MovieFinder.swift
//  NaverOpenAPITest
//
//  Created by Kyungsoo Lee on 2022/09/01.
//

import SwiftUI

fileprivate enum NaverOpenAPI {
    static let clientID = "VGhUmZ1wpGRdza0chyX8"
    static let clientSecret = "Vug55KX4DX"
    
    static let scheme = "https"
    static let host = "openapi.naver.com"
    
    enum Path: String {
        
        case movie = "/v1/search/movie.json"
    }
}

class MovieFinder: ObservableObject {
    @Published var model = BoxOffice()
    @Published var fetchingStatus = FetchStatus.idle
    
    func fetchMovieList() {
        fetchingStatus = .fetching
        var urlComponents = URLComponents()
        urlComponents.scheme = NaverOpenAPI.scheme
        urlComponents.host = NaverOpenAPI.host
        urlComponents.path = NaverOpenAPI.Path.movie.rawValue
        urlComponents.queryItems = [URLQueryItem(name: "query", value: model.searchKeyword)]
        guard let url = urlComponents.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(NaverOpenAPI.clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        urlRequest.addValue(NaverOpenAPI.clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        let task = URLSession.shared.dataTask(with: urlRequest) {data, response, error in
            guard error == nil,
                  let httpURLResponse = response as? HTTPURLResponse,
                  (200 ... 299).contains(httpURLResponse.statusCode),
                  let data = data,
                  let parsedData = try? JSONDecoder().decode(Response.self, from: data)
            else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.model.movies = parsedData.items.indices.map {
                    BoxOffice.Movie(parsedData.items[$0], id: parsedData.start + $0)
                }
                self?.fetchingStatus = .idle
            }
        }
        task.resume()
    }
}

extension MovieFinder {
    
    struct Response: Codable {
        
        let lastBuildDate: String
        let total: Int
        let start: Int
        let display: Int
        let items: [Movie]
        
        struct Movie: Codable {
            
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
    
    enum FetchStatus {
        
        case idle
        case fetching
    }
}
