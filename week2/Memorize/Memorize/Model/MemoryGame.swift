//
//  MemoryGame.swift
//  Memorize
//
//  Created by 임주민 on 2022/08/05.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
  
  var cards: [Card]
  private var firstChosenCardIndex: Int?
  private var secondChosenCardIndex: Int?
  
  init(numberOfPairsOfCard: Int, createContent: (Int) -> CardContent) {
    cards = [Card]()
    for pairIndex in 0..<numberOfPairsOfCard {
      let content = createContent(pairIndex)
      cards.append(Card(content: content, id: 2 * pairIndex))
      cards.append(Card(content: content, id: 2 * pairIndex + 1))
    }
  }
  
  mutating func choose(_ card: Card) {
    if let currentChosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
      cards[currentChosenIndex].isFaceUp.toggle()
        if let prevChosenCardIndex = firstChosenCardIndex {
          if let afterChosenCardIndex = secondChosenCardIndex {
          if cards[afterChosenCardIndex].content == cards[prevChosenCardIndex].content {
            cards[afterChosenCardIndex].isMatched = true
            cards[prevChosenCardIndex].isMatched = true
          }
          cards[afterChosenCardIndex].isFaceUp.toggle()
          cards[prevChosenCardIndex].isFaceUp.toggle()
          secondChosenCardIndex = nil
          firstChosenCardIndex = currentChosenIndex
        } else {
          secondChosenCardIndex = currentChosenIndex
        }
      } else {
        firstChosenCardIndex = currentChosenIndex
      }
    }
  }
  
  struct Card: Identifiable {
    
    var isFaceUp = false
    var isMatched = false
    var content: CardContent
    var id: Int
  }
}
