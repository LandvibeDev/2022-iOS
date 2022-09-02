//
//  BookCell.swift
//  ApiTest
//
//  Created by 임주민 on 2022/09/01.
//

import SwiftUI

struct BookCell: View {
  
  let book: Book
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5)  {
      AsyncImage(url: URL(string: book.image)) { phase in
        switch phase {
        case .success(let image):
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 120, alignment: .center)
        case .failure:
          Image(systemName: "questionmark.square")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .frame(width: 80, height: 120, alignment: .center)
        case .empty:
          ProgressView()
            .frame(width: 80, height: 120, alignment: .center)
        @unknown default:
          EmptyView()
            .frame(width: 80, height: 120, alignment: .center)
        }
      }
      Text(book.title)
        .fontWeight(.bold)
        .foregroundColor(.indigo)
        .lineLimit(2)
        .fixedSize(horizontal: false, vertical: true)
      Text(book.author + "(지은이)")
      Text(book.publisher + " | " + book.pubdate)
      Text(book.discount == "0"
           ? "가격정보 없음"
           : book.discount.insertComma + "원")
      .foregroundColor(.pink)
      .fontWeight(.bold)
      Spacer()
    }
    .font(.footnote)
    .frame(width: 100, height: 230)
  }
}
