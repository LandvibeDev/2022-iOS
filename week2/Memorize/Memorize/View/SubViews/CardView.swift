//
//  CardView.swift
//  Memorize
//
//  Created by 임주민 on 2022/07/28.
//

import SwiftUI

struct CardView: View {
  
  let card: MemoryGame<String>.Card
  
  init(_ card: MemoryGame<String>.Card) {
    self.card = card
  }
  
  var body: some View {
    ZStack{
      let shape = RoundedRectangle(cornerRadius: 15)
      if card.isFaceUp {
        shape.strokeBorder(lineWidth: 5)
        Text(card.content).font(.system(size: 40))
      } else if card.isMatched {
        shape.fill().opacity(0)
      } else {
        shape.fill()
      }
    }
    .aspectRatio(2 / 3, contentMode: .fit)
  }
}

struct CardView_Previews: PreviewProvider {
  
  static var previews: some View {
    let card = MemoryGame<String>.Card(isFaceUp: true, isMatched: false, content: "🫡", id: 0)
    CardView(card)
  }
}
