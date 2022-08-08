//
//  MemoryGame.swift
//  Memorize
//
//  Created by 임주민 on 2022/08/05.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
  
  private(set) var cards: [Card]
  private(set) var gameState: GameState = .playing
  private(set) var point = 0
  private var prevChosenCardIndex: Int?
  private var numberOfMatchedCard = 0
  
  enum GameState {
    case playing, done
  }
  
  init(numberOfCardPairs: Int, createContent: (Int) -> CardContent) {
    cards = [Card]()
    for pairIndex in 0..<numberOfCardPairs {
      let content = createContent(pairIndex)
      cards.append(Card(content: content, id: 2 * pairIndex))
      cards.append(Card(content: content, id: 2 * pairIndex + 1))
    }
    cards.shuffle()
  }
  
  mutating func choose(_ card: Card) {
    if let currentChosenCardIndex = cards.firstIndex(where: { $0.id == card.id }) {
      if cards[currentChosenCardIndex].isAlreadyOpened == true {
        point -= 1
      }
      if let alreadyChosenCardIndex = prevChosenCardIndex {
        if cards[currentChosenCardIndex].id != cards[alreadyChosenCardIndex].id {
          if cards[currentChosenCardIndex].content == cards[alreadyChosenCardIndex].content {
            cards[currentChosenCardIndex].isMatched = true
            cards[alreadyChosenCardIndex].isMatched = true
            numberOfMatchedCard += 2
            point += 3
          }
          prevChosenCardIndex = nil
        }
      } else {
        for index in 0..<cards.count {
          cards[index].isFaceUp = false
        }
        prevChosenCardIndex = currentChosenCardIndex
      }
      cards[currentChosenCardIndex].isFaceUp.toggle()
      cards[currentChosenCardIndex].isAlreadyOpened = true
      if numberOfMatchedCard == cards.count {
        gameState = .done
      }
    }
  }
  
  struct Card: Identifiable {
    
    var isFaceUp = false
    var isMatched = false
    var isAlreadyOpened = false
    var content: CardContent
    var id: Int
  }
}
