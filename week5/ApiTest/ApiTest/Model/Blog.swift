//
//  BlogSearch.swift
//  ApiTest
//
//  Created by 임주민 on 2022/09/02.
//

import Foundation

struct BookBlogSearch {
  
  var searchKeyword = ""
  var blogs: [Blog] = []
}

struct ResponseBlog: Codable {
  
  let lastBuildDate: String
  let total, start, display: Int
  let items: [Blog]
}

struct Blog: Codable, Identifiable {
  
  let title: String
  let link: String
  let description, bloggername: String
  let bloggerlink: String
  let postdate: String
  let id: Int?
  
  init(_ blog: Blog, id: Int) {
    title = blog.title
    link = blog.link
    description = blog.description
    bloggername = blog.bloggername
    bloggerlink = blog.bloggerlink
    postdate = blog.postdate
    self.id = id
  }
}
