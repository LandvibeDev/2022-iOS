//
//  NetworkManager.swift
//  NaverOpenAPITest
//
//  Created by ohhyeongseok on 2022/09/05.
//

import Foundation

fileprivate enum NaverOpenAPI {
    static let clientID = "QDph9OaM58FywxjbaSDe"
    static let clientSecret = "7BEzAGG02o"
    static let scheme = "https"
    static let host = "openapi.naver.com"
}

class NetworkManager {
    
    private func fillUrlComponents(path: String, query: String) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = NaverOpenAPI.scheme
        urlComponents.host = NaverOpenAPI.host
        urlComponents.path = path
        urlComponents.queryItems = [URLQueryItem(name: "query", value: query)]
        return urlComponents
    }
    
    private func fillUrlReuqest(url: URL, httpMethod: String) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        urlRequest.addValue(NaverOpenAPI.clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        urlRequest.addValue(NaverOpenAPI.clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        return urlRequest
    }
    
    func fetchNewsList(path: String, query: String, fetchDataInBackground: @escaping (_ parsedData: NewsResponse) -> Void) {
        let urlComponents = fillUrlComponents(path: path, query: query)
        guard let url = urlComponents.url else {
            return
        }
        let urlRequest = fillUrlReuqest(url: url, httpMethod: HttpMethod.get.rawValue)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                print("에러가 occur!")
                return
            }
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                print ("server error!!")
                return
            }
            guard let data = data, let parsedData = try? JSONDecoder().decode(NewsResponse.self, from: data) else {
                print("data error!")
                return
            }
            fetchDataInBackground(parsedData)
        }
        task.resume()
    }
    
    func fetchDocumentList(path: String, query: String, fetchDataInBackground: @escaping (_ parsedData: DocumentResponse) -> Void) {
        let urlComponents = fillUrlComponents(path: path, query: query)
        guard let url = urlComponents.url else {
            return
        }
        let urlRequest = fillUrlReuqest(url: url, httpMethod: HttpMethod.get.rawValue)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                print("에러가 occur!")
                return
            }
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                print ("server error!!")
                return
            }
            guard let data = data, let parsedData = try? JSONDecoder().decode(DocumentResponse.self, from: data) else {
                print("data error!")
                return
            }
            fetchDataInBackground(parsedData)
        }
        task.resume()
    }
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
