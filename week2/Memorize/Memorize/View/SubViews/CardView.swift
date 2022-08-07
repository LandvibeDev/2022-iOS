//
//  CardView.swift
//  Memorize
//
//  Created by 임주민 on 2022/07/28.
//

import SwiftUI

struct CardView: View {

  let card: MemoryGame<String>.Card
  
  var body: some View {
    ZStack{
      let shape = RoundedRectangle(cornerRadius: 15)
      if card.isMatched {
        shape.hidden()
      } else if card.isFaceUp {
        shape.strokeBorder(lineWidth: 5)
        Text(card.content).font(.system(size: 40))
      } else {
        shape.fill()
      }
    }
    .foregroundColor(Color.red)
    .aspectRatio(2 / 3, contentMode: .fit)
  }
}

struct CardView_Previews: PreviewProvider {
  
  static var previews: some View {
    let card = MemoryGame<String>.Card(isFaceUp: true, isMatched: true, content: "🫡", id: 0)
    CardView(card: card)
  }
}
