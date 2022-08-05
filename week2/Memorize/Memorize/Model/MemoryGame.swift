//
//  MemoryGame.swift
//  Memorize
//
//  Created by 임주민 on 2022/08/05.
//

import Foundation

struct MemoryGame<CardContent> {
  
  var cards: [Card]
  
  init(numberOfPairsOfCard: Int, createContent: (Int) -> CardContent) {
    cards = [Card]()
    for pairIndex in 0..<numberOfPairsOfCard {
      let content = createContent(pairIndex)
      cards.append(Card(content: content, id: 2 * pairIndex))
      cards.append(Card(content: content, id: 2 * pairIndex + 1))
    }
  }
  
  mutating func choose(_ card: Card) {
    if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
      cards[chosenIndex].isFaceUp.toggle()
    }
  }
  
  struct Card: Identifiable {
    
    var isFaceUp = true
    var isMatched = false
    var content: CardContent
    var id: Int
  }
}
