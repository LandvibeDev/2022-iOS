//
//  APIConstants.swift
//  ApiTest
//
//  Created by 임주민 on 2022/09/01.
//

import Foundation

enum APIConstants: String {
  
  case getBookInfo =  "/v1/search/book.json"
  case getBookBlog = "/v1/search/blog.json"
  
  static let clientID = "_hygi4FZdNOUpQsd7K__"
  static let clientSecret = "CFBpqq7uVg"
  static let scheme = "https"
  static let host = "openapi.naver.com"
  static let successRange = 200..<300
}
