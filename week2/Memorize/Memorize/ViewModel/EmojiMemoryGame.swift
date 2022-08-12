//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 임주민 on 2022/08/05.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
  
  private static func createEmojiMemoryGame() -> MemoryGame<String> {
    let numberOfCardPairs =  theme.numberOfCardPairsToShow > theme.content.count ? theme.content.count : theme.numberOfCardPairsToShow
    return MemoryGame<String>(numberOfCardPairs: numberOfCardPairs) { pairIndex in theme.content[pairIndex] }
  }
  
  @Published private var memoryGameModel = createEmojiMemoryGame()
  static var theme = EmojiTheme.allCases.randomElement() ?? .vehicles
  
  var cards: [MemoryGame<String>.Card] {
    memoryGameModel.cards
  }
  
  var isGameDone: Bool {
    memoryGameModel.isGameDone
  }
  
  var point: Int {
    memoryGameModel.point
  }
  
  var title: String {
    let firstUppercasedTitle = EmojiMemoryGame.theme.rawValue.prefix(1).uppercased() + EmojiMemoryGame.theme.rawValue.dropFirst()
    return firstUppercasedTitle
  }
  
  var themecolor: Color {
    switch EmojiMemoryGame.theme.color {
    case "pink":
      return .pink
    case "yellow":
      return .yellow
    case "orange":
      return .orange
    case "green":
      return .green
    case "black":
      return .black
    case "blue":
      return .blue
    default:
      return .pink
    }
  }
  
  // MARK: - Intentions
  
  func choose(_ card: MemoryGame<String>.Card) {
    memoryGameModel.choose(card)
  }
  
  func newGame() {
    EmojiMemoryGame.theme = EmojiTheme.allCases.randomElement()!
    memoryGameModel = EmojiMemoryGame.createEmojiMemoryGame()
  }
}
