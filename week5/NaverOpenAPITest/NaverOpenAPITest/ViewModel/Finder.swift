//
//  Network.swift
//  NaverOpenAPITest
//
//  Created by ohhyeongseok on 2022/09/02.
//

import Foundation

class Finder: ObservableObject {
    @Published var newsDesk = NewsDesk()
    @Published var encyclopedia = Encyclopedia()
    @Published var fetchingStatus = FetchStatus.idle
    let networkManager = NetworkManager()
    
    func fetchNews() {
        fetchingStatus = .fetching
        networkManager.fetchNewsList(path: newsDesk.path, query: newsDesk.searchKeyword) { parsedData in
            DispatchQueue.main.async { [weak self] in
                self?.newsDesk.news = parsedData.items.indices.map {
                    NewsDesk.News(parsedData.items[$0], id: parsedData.start + $0)
                }
                self?.fetchingStatus = .idle
            }
        }
    }
    
    func fetchDocument() {
        fetchingStatus = .fetching
        networkManager.fetchDocumentList(path: encyclopedia.path, query: encyclopedia.searchKeyword) { parsedData in
            DispatchQueue.main.async { [weak self] in
                self?.encyclopedia.documents = parsedData.items.indices.map {
                    Encyclopedia.Document(parsedData.items[$0], id: parsedData.start + $0)
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

struct NewsResponse: Codable {
    let lastBuildDate: String
    let total: Int
    let start: Int
    let display: Int
    let items: [News]
    
    struct News: Codable {
        let title: String
        let originallink: String
        let link: String
        let description: String
        let pubDate: String
    }
}

struct DocumentResponse: Codable {
    let lastBuildDate: String
    let total: Int
    let start: Int
    let display: Int
    let items: [Document]
    
    struct Document: Codable {
        let title: String
        let link: String
        let description: String
        let thumbnail: String
    }
}
