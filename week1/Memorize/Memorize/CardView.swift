//
//  CardView.swift
//  Memorize
//
//  Created by 임주민 on 2022/07/28.
//

import SwiftUI

struct CardView: View {
  var body: some View {
    RoundedRectangle(cornerRadius: 15)
      .strokeBorder(lineWidth: 5)
      .foregroundColor(Color.red)
      .aspectRatio(2/3, contentMode: .fit)
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView()
  }
}
