//
//  Network.swift
//  NaverOpenAPITest
//
//  Created by ohhyeongseok on 2022/09/02.
//

import Foundation

fileprivate enum NaverOpenAPI {
    static let clientID = "QDph9OaM58FywxjbaSDe"
    static let clientSecret = "7BEzAGG02o"
    static let scheme = "https"
    static let host = "openapi.naver.com"
}

class Finder<Article: Searchable>: ObservableObject {
    @Published var model = Article()
    @Published var fetchingStatus = FetchStatus.idle
    private var urlComponents = URLComponents()
    
    init() {
        urlComponents.scheme = NaverOpenAPI.scheme
        urlComponents.host = NaverOpenAPI.host
    }
    
    func fetchDataList(wantToSearch: Article) {
        fetchingStatus = .fetching
        urlComponents.path = wantToSearch.path
        urlComponents.queryItems = [URLQueryItem(name: "query", value: wantToSearch.searchKeyword)]
        guard let url = urlComponents.url
        else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(NaverOpenAPI.clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        urlRequest.addValue(NaverOpenAPI.clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            // 각기 다른 예외처리를 하는 것이 좋겠죠 ?  --> 기능 완성하고 변경하겠습니다 ㅠ
            guard error == nil,
                  let httpURLResponse = response as? HTTPURLResponse,
                  (200 ... 299).contains(httpURLResponse.statusCode),
                  let data = data,
                  let parsedData = try? JSONDecoder().decode(Response.self, from: data)
            else { return }
            DispatchQueue.main.async { [weak self] in
                self?.model.elements = parsedData.items.indices.map {
                    BoxOffice.Movie(parsedData.items[$0], id: parsedData.start + $0)
                }
                self?.fetchingStatus = .idle
            }
        }
        task.resume()
        fetchingStatus = .idle
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
