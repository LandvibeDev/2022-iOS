//
//  BookList.swift
//  ApiTest
//
//  Created by 임주민 on 2022/09/01.
//

import SwiftUI

struct SearchList: View {
  
  @ObservedObject var bookFinder: BookFinder
  
  var body: some View {
    NavigationView {
      List {
        HStack {
          TextField(text: $bookFinder.bookModel.searchKeyword, label: { Text("ex. 해리포터") })
          Button {
            bookFinder.fetchBookList()
            bookFinder.fetchBookBlog()
          } label: {
            Text("검색")
          }.buttonStyle(.bordered)
        }
        Section {
          ScrollView(.horizontal) {
            LazyHStack {
              ForEach(bookFinder.bookModel.books) { book in
                BookCell(book: book)
                Spacer()
              }
            }
          }
        }
        Section {
          VStack(spacing: 8) {
            ForEach(bookFinder.blogModel.blogs) { blog in
              BlogCell(blog: blog)
              NavigationLink(destination: BlogWebView(urlToLoad: blog.link)) {
                Text("글 보러가기").font(.footnote)
              }
              Spacer()
            }
          }
        }
      }
    }
  }
}
