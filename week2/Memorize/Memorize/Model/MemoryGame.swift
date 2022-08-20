//
//  MemoryGame.swift
//  Memorize
//
//  Created by 임주민 on 2022/08/05.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
  
  private(set) var cards: [Card]
  private(set) var point = 0
  private var numberOfMatchedCard = 0
  private var previousChosenCardIndex: Int? {
    get { cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly }
    set { cards.indices.forEach{cards[$0].isFaceUp = ($0 == newValue)} }
  }
  var isGameDone: Bool {
    numberOfMatchedCard == cards.count
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
      if cards[currentChosenCardIndex].isFaceUpAtLeastOne {
        point -= 1
      }
      if let alreadyChosenCardIndex = previousChosenCardIndex {
        if cards[currentChosenCardIndex].id != cards[alreadyChosenCardIndex].id,
           cards[currentChosenCardIndex].content == cards[alreadyChosenCardIndex].content {
          cards[currentChosenCardIndex].isMatched = true
          cards[alreadyChosenCardIndex].isMatched = true
          numberOfMatchedCard += 2
          point += 3
        }
      } else {
        for index in 0..<cards.count {
          cards[index].isFaceUp = false
        }
      }
      cards[currentChosenCardIndex].isFaceUp.toggle()
      cards[currentChosenCardIndex].isFaceUpAtLeastOne = true
    }
  }
  
  struct Card: Identifiable {
    
    var isFaceUp = false
    var isMatched = false
    var isFaceUpAtLeastOne = false
    let content: CardContent
    let id: Int
  }
}

extension Array {
  
  var oneAndOnly: Element? {
    return self.count == 1 ? self.first : nil
  }
}
