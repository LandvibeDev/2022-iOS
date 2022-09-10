//
//  ImageFinder.swift
//  NetworkModule
//
//  Created by Kyungsoo Lee on 2022/09/06.
//

import SwiftUI

fileprivate enum NaverOpenAPI {
    static let clientID = "vfkVCXywSz01QA2Jchtx"
    static let clientSecret = "ZXK_oFQNXc"
    
    static let scheme = "https"
    static let host = "openapi.naver.com"
    
    enum Path: String {
        case image = "/v1/search/image.json"
    }
}

class ImageFinder: ObservableObject {
    @Published var model = ImageBox()
    @Published var fetchingStatus = FetchStatus.idle
    
    func fetchImageList() {
        fetchingStatus = .fetching
        var urlComponents = URLComponents()
        urlComponents.scheme = NaverOpenAPI.scheme
        urlComponents.host = NaverOpenAPI.host
        urlComponents.path = NaverOpenAPI.Path.image.rawValue
        urlComponents.queryItems = [URLQueryItem(name: "query", value: model.searchKeyword)]
        guard let url = urlComponents.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(NaverOpenAPI.clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        urlRequest.addValue(NaverOpenAPI.clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        let task = URLSession.shared.dataTask(with: urlRequest) {data, response, error in
            guard error == nil,
                  let httpURLResponse = response as?HTTPURLResponse,
                  (200 ... 299).contains(httpURLResponse.statusCode),
                  let data = data,
                  let parsedData = try? JSONDecoder().decode(Response.self, from: data)
            else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.model.images = parsedData.items.indices.map {
                    ImageBox.ImageInfo(parsedData.items[$0], id: parsedData.start + $0)
                }
                self?.fetchingStatus = .idle
            }
        }
        task.resume()
    }
}

extension ImageFinder {
    struct Response: Codable {
        let lastBuildDate: String
        let total: Int
        let start: Int
        let display: Int
        let items: [ImageInfo]
        
        struct ImageInfo: Codable {
            let title: String
            let link: String
            let thumbnail: String
            let sizeheight: String
            let sizewidth: String
        }
    }
    
    enum FetchStatus {
        case idle
        case fetching
    }
}
