//
//  ResultView.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import SwiftUI

struct ResultView: View {
  
  let showingText: String
  
  var body: some View {
    HStack {
      Spacer()
      Text(showingText)
        .font(.system(size: 60))
        .padding(.trailing, 50)
    }
  }
}
