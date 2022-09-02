//
//  Book.swift
//  ApiTest
//
//  Created by 임주민 on 2022/09/01.
//

import Foundation

struct BookSearch {
  
  var searchKeyword = ""
  var books: [Book] = []
}

struct ResponseBook: Codable {
  
  let lastBuildDate: String
  let total, start, display: Int
  let items: [Book]
}

struct Book: Codable, Identifiable {
  
  let title: String
  let link: String
  let image: String
  let author, discount, publisher, pubdate: String
  let isbn, description: String
  let id: Int?
  
  init(_ book: Book, id: Int) {
    title = book.title
    link = book.link
    image = book.image
    author = book.author
    discount = book.discount
    publisher = book.publisher
    pubdate = book.pubdate
    isbn = book.isbn
    description = book.description
    self.id = id
  }
}
