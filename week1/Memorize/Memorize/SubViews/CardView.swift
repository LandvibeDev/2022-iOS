//
//  CardView.swift
//  Memorize
//
//  Created by 임주민 on 2022/07/28.
//

import SwiftUI

struct CardView: View {
  @State var isFaceUp = true
  var content = ""
  
  var body: some View {
    ZStack{
      let shape = RoundedRectangle(cornerRadius: 15)
      if isFaceUp {
        shape.strokeBorder(lineWidth: 5)
        Text(content).font(.system(size: 40))
      } else {
        shape.fill()
      }
    }
    .foregroundColor(Color.red)
    .aspectRatio(2 / 3, contentMode: .fit)
    .onTapGesture {
      isFaceUp.toggle()
    }
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView()
  }
}
