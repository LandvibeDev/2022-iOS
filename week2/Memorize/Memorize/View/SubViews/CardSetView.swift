//
//  CardSetView.swift
//  Memorize
//
//  Created by 임주민 on 2022/08/13.
//

import SwiftUI

struct CardSetView: View {
  
  @ObservedObject var memoryGameManager: EmojiMemoryGame
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 100))],  spacing: 10) {
        ForEach(memoryGameManager.cards) { card in
          CardView(card: card)
            .onTapGesture {
              memoryGameManager.choose(card)
            }
        }
      }
    }
  }
}

struct CardSetView_Previews: PreviewProvider {
  
  static var previews: some View {
    let memoryGameManager = EmojiMemoryGame()
    CardSetView(memoryGameManager: memoryGameManager)
  }
}
