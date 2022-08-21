//
//  ResultView.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import SwiftUI

struct ResultView: View {
  
  let showingText: Double
  
  var body: some View {
    HStack {
      Spacer()
      Text(showingText.clean)
        .font(.system(size: 60))
    }
  }
}

struct ResultView_Previews: PreviewProvider {
  static var previews: some View {
    let showingText = 10.0
    ResultView(showingText: showingText)
  }
}
