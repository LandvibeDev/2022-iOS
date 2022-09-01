//
//  BookFinder.swift
//  ApiTest
//
//  Created by 임주민 on 2022/09/01.
//

import SwiftUI

class BookFinder: ObservableObject {
  
  @Published var model = BookSearch()
  
  private func makeURLComponents(path: String, query: String) -> URLComponents {
    var urlComponents = URLComponents()
    urlComponents.scheme = APIConstants.scheme
    urlComponents.host = APIConstants.host
    urlComponents.path = path
    urlComponents.queryItems = [URLQueryItem(name: "query", value: query)]
    
    return urlComponents
  }
  
  private func makeURLGETRequest(url: URL) -> URLRequest {
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    urlRequest.addValue(APIConstants.clientID, forHTTPHeaderField: "X-Naver-Client-Id")
    urlRequest.addValue(APIConstants.clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
    
    return urlRequest
  }
  
  func fetchBookList() {
    guard let componentsURL = makeURLComponents(path: APIConstants.getBookInfo.rawValue,
                                                query: model.searchKeyword).url
    else { return }
    let requestURL = makeURLGETRequest(url: componentsURL)
    let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
      guard error == nil,
            let httpURLResponse = response as? HTTPURLResponse,
            APIConstants.successRange.contains(httpURLResponse.statusCode)
      else { return }
      guard let data = data,
            let parsedData = try? JSONDecoder().decode(Response.self, from: data)
      else { return }
      DispatchQueue.main.async { [weak self] in
        self?.model.books = parsedData.items.indices.map {
          Book(parsedData.items[$0], id: parsedData.start + $0)
        }
      }
    }
    task.resume()
  }
}
