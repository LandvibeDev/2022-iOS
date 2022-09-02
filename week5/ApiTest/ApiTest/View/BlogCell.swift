//
//  BlogCell.swift
//  ApiTest
//
//  Created by 임주민 on 2022/09/02.
//

import SwiftUI

struct BlogCell: View {
  
  let blog: Blog
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(AttributedString(htmlString: blog.title) ?? "")
        .font(.body)
        .fontWeight(.bold)
        .lineLimit(2)
        .fixedSize(horizontal: false, vertical: true)
      Text(blog.bloggername)
      Text(blog.postdate).foregroundColor(.indigo)
      Text(AttributedString(htmlString: blog.description) ?? "")
        .foregroundColor(.gray)
        .lineLimit(3)
        .fixedSize(horizontal: false, vertical: true)
    }.font(.footnote)
  }
}
