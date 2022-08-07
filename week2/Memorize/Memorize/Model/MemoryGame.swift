//
//  MemoryGame.swift
//  Memorize
//
//  Created by 임주민 on 2022/08/05.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
  
  var cards: [Card]
  var gameState: GameState = .playing
  private var firstChosenCardIndex: Int?
  private var secondChosenCardIndex: Int?
  private var numberOfMatchedCard = 0
  
  enum GameState {
    case playing
    case done
  }
  
  init(numberOfCardPairs: Int, createContent: (Int) -> CardContent) {
    cards = [Card]()
    for pairIndex in 0..<numberOfCardPairs {
      let content = createContent(pairIndex)
      cards.append(Card(content: content, id: 2 * pairIndex))
      cards.append(Card(content: content, id: 2 * pairIndex + 1))
    }
  }
  
  mutating func choose(_ card: Card) {
    if let currentChosenCardIndex = cards.firstIndex(where: { $0.id == card.id }) {
      cards[currentChosenCardIndex].isFaceUp.toggle()
        if let prevChosenCardIndex = firstChosenCardIndex {
          if let afterChosenCardIndex = secondChosenCardIndex {
          if cards[afterChosenCardIndex].content == cards[prevChosenCardIndex].content {
            cards[afterChosenCardIndex].isMatched = true
            cards[prevChosenCardIndex].isMatched = true
            numberOfMatchedCard += 2
          }
          cards[afterChosenCardIndex].isFaceUp.toggle()
          cards[prevChosenCardIndex].isFaceUp.toggle()
          secondChosenCardIndex = nil
          firstChosenCardIndex = currentChosenCardIndex
        } else {
          if (numberOfMatchedCard == cards.count-2) {
            cards[currentChosenCardIndex].isMatched = true
            cards[prevChosenCardIndex].isMatched = true
            gameState = .done
          }
          secondChosenCardIndex = currentChosenCardIndex
        }
      } else {
        firstChosenCardIndex = currentChosenCardIndex
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
