//
//  MovieFinder.swift
//  NaverOpenAPITest
//
//  Created by Byeongjo Koo on 2022/08/28.
//

import SwiftUI

fileprivate enum NaverOpenAPI {
    
    static let clientID = "qlB1HcFJd3OzMSkIaZOr"
    static let clientSecret = "gwWu75hhTE"
    
    static let scheme = "https"
    static let host = "openapi.naver.com"
    
    enum Path: String {
        
        case movie = "/v1/search/movie.json"
    }
}

class MovieFinder: ObservableObject {
    
    @Published var model = BoxOffice()
    @Published var fetchingStatus = FetchStatus.idle
    
    //TODO: 모든 네트워크를 관리할 수 있는 모듈을 만들어 주세요.
    /*
     네트워크 관련 읽어보면 좋은(사실 필수) 문서.
     https://developer.apple.com/documentation/foundation/url_loading_system
     */
    
    /// 서버를 통해 검색어와 관련된 영화 목록을 가져오는 메서드 입니다.
    /// - Parameter query: 검색어.
    func fetchMovieList() {
        fetchingStatus = .fetching
        var urlComponents = URLComponents()
        urlComponents.scheme = NaverOpenAPI.scheme
        urlComponents.host = NaverOpenAPI.host
        urlComponents.path = NaverOpenAPI.Path.movie.rawValue
        urlComponents.queryItems = [URLQueryItem(name: "query", value: model.searchKeyword)]
        guard let url = urlComponents.url
        else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(NaverOpenAPI.clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        urlRequest.addValue(NaverOpenAPI.clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            // 각기 다른 예외처리를 하는 것이 좋겠죠 ?
            guard error == nil,
                  let httpURLResponse = response as? HTTPURLResponse,
                  (200 ... 299).contains(httpURLResponse.statusCode),
                  let data = data,
                  let parsedData = try? JSONDecoder().decode(Response.self, from: data)
            else { return }
            /*
             GCD 관련 참고자료
             https://zeddios.tistory.com/516
             https://developer.apple.com/videos/play/wwdc2015/718/
             다른 GCD관련 WWDC 영상도 참고 하면 좋을 거 같아요. 다만, 한글 자막은 없어요;;
             */
            /*
             ARC 개념도 다시 정립해봅시다 !
             */
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
