//
//  TopInfoView.swift
//  Memorize
//
//  Created by 임주민 on 2022/08/13.
//

import SwiftUI

struct TopInfoView: View {
  
  let title: String
  let point: Int
  
  var body: some View {
    VStack{
      Text(title)
      Text("point : \(point)").font(.body)
    }
  }
}

struct TopInfoView_Previews: PreviewProvider {
  
  static var previews: some View {
    TopInfoView(title: "Title", point: 0)
  }
}
