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
    MemoryGame<String>(numberOfPairsOfCard: 5) { pairIndex in emojis[pairIndex] }
  }
  
  @Published private var model = createEmojiMemoryGame()
  
  var cards: [MemoryGame<String>.Card] {
    model.cards
  }
  
  // MARK: - Intentions
  
  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }
}
