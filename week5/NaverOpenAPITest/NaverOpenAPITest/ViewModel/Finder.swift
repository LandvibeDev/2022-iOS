//
//  Network.swift
//  NaverOpenAPITest
//
//  Created by ohhyeongseok on 2022/09/02.
//

import Foundation

class Finder: ObservableObject {
    @Published var newsModei = NewsDesk()
    @Published var movieModel = BoxOffice()
    @Published var documentModel = Encyclopedia()
    @Published var fetchingStatus = FetchStatus.idle
    var networkManager = NetworkManager()
  
    func fetch() {
        fetchingStatus = .fetching
        networkManager.fetchDataList(path: movieModel.path, query: movieModel.searchKeyword) { parsedData in
            DispatchQueue.main.async { [weak self] in
                self?.movieModel.movies = parsedData.items.indices.map {
                    BoxOffice.Movie(parsedData.items[$0], id: parsedData.start + $0)
                }
                self?.fetchingStatus = .idle
            }
        }
    }
    
    enum FetchStatus {
        case idle
        case fetching
    }
}

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
    
    struct News: Codable {
        let title: String
        let originallink: String
        let link: String
        let description: String
        let pubDate: String
    }
    
    struct Document: Codable {
        let title: String
        let link: String
        let description: String
        let thumbnail: String
    }
}
