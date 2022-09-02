//
//  BookFinder.swift
//  ApiTest
//
//  Created by 임주민 on 2022/09/01.
//

import SwiftUI

class BookFinder: ObservableObject {
  
  @Published var bookModel = BookSearch()
  @Published var blogModel = BookBlogSearch()
  
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
                                                query: bookModel.searchKeyword).url
    else { return }
    let requestURL = makeURLGETRequest(url: componentsURL)
    let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
      guard error == nil,
            let httpURLResponse = response as? HTTPURLResponse,
            APIConstants.successRange.contains(httpURLResponse.statusCode)
      else { return }
      guard let data = data,
            let parsedData = try? JSONDecoder().decode(ResponseBook.self, from: data)
      else { return }
      DispatchQueue.main.async { [weak self] in
        self?.bookModel.books = parsedData.items.indices.map {
          Book(parsedData.items[$0], id: parsedData.start + $0)
        }
      }
    }
    task.resume()
  }
  
  func fetchBookBlog() {
    guard let componentsURL = makeURLComponents(path: APIConstants.getBookBlog.rawValue,
                                                query: bookModel.searchKeyword + "책").url
    else { return }
    let requestURL = makeURLGETRequest(url: componentsURL)
    let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
      guard error == nil,
            let httpURLResponse = response as? HTTPURLResponse,
            APIConstants.successRange.contains(httpURLResponse.statusCode)
      else { return }
      guard let data = data,
            let parsedData = try? JSONDecoder().decode(ResponseBlog.self, from: data)
      else { return }
      DispatchQueue.main.async { [weak self] in
        self?.blogModel.blogs = parsedData.items
        self?.blogModel.blogs = parsedData.items.indices.map {
          Blog(parsedData.items[$0], id: parsedData.start + $0)
        }
      }
    }
    task.resume()
  }
}
