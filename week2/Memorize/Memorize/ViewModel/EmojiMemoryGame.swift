//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 임주민 on 2022/08/05.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
  
  private static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚜", "🚚", "🚛", "🛻", "🚎", "🚐", "🚒", "🚑", "🚓", "🏎", "🚞", "🚆", "🚁", "🚀"]
  
  private static func createEmojiMemoryGame() -> MemoryGame<String> {
    MemoryGame<String>(numberOfCardPairs: 5) { pairIndex in emojis[pairIndex] }
  }
  
  @Published private var memoryGameModel = createEmojiMemoryGame()
  
  var cards: [MemoryGame<String>.Card] {
    memoryGameModel.cards
  }
  
  var state: MemoryGame<String>.GameState {
    memoryGameModel.gameState
  }
  
  var point: Int {
    memoryGameModel.point
  }
  
  
  // MARK: - Intentions
  
  func choose(_ card: MemoryGame<String>.Card) {
    memoryGameModel.choose(card)
  }
  
  func newGame() {
    memoryGameModel = EmojiMemoryGame.createEmojiMemoryGame()
  }
}
