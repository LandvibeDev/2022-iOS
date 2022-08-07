//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 임주민 on 2022/08/05.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
  
  static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚜", "🚚", "🚛", "🛻", "🚎", "🚐", "🚒", "🚑", "🚓", "🏎", "🚞", "🚆", "🚁", "🚀"]
  
  static func createEmojiMemoryGame() -> MemoryGame<String> {
    MemoryGame<String>(numberOfCardPairs: 5) { pairIndex in emojis[pairIndex] }
  }
  
  @Published private var model = createEmojiMemoryGame()
  
  var cards: [MemoryGame<String>.Card] {
    model.cards
  }
  
  var state: MemoryGame<String>.GameState {
    model.gameState
  }
  
  // MARK: - Intentions
  
  func choose(_ card: MemoryGame<String>.Card) {
    print(state)
    model.choose(card)
  }
}
