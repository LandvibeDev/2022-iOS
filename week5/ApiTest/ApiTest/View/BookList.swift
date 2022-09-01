//
//  BookList.swift
//  ApiTest
//
//  Created by 임주민 on 2022/09/01.
//

import SwiftUI

struct BookList: View {
  
  @ObservedObject var viewModel: BookFinder
  
  var body: some View {
    ZStack {
      List {
        HStack {
          TextField(text: $viewModel.model.searchKeyword, label: { Text("ex. 해리포터") })
          Button(action: { viewModel.fetchBookList() }) {
            Text("검색")
          }.buttonStyle(.bordered)
        }
        Section {
          ForEach(viewModel.model.books) { book in
            VStack {
              BookCell(book: book)
              Spacer()
            }
          }
        }
      }
    }
  }
}

struct BookList_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = BookFinder()
    BookList(viewModel: viewModel)
  }
}
