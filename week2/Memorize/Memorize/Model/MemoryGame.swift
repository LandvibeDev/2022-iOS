//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/02.
//

import Foundation

/*
 Point 계산 부분 구현 다시해보기
 */

struct MemoryGame<CardContent: Equatable> {
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var isFaceUpBefore = false
        var content: CardContent
        var id: Int
    }
    
    var cards: [Card]
    var selectedCardsIndex: [Int]
    var point: Int
    var countOfCurrentOpenedCard: Int
    var alreadySelectedIndex: Int
    let numberOfCardPair: Int
    var numberOfmatchedPair: Int
    var theme: Theme
    
    init(theme: Theme, createContent: (Int) -> CardContent) {
        cards = [Card]()
        self.point = 0
        self.cards = cards.shuffled()
        self.theme = theme
        self.numberOfCardPair = theme.numberOfCardPair
        numberOfmatchedPair = 0
        countOfCurrentOpenedCard = 0
        alreadySelectedIndex = 0
        selectedCardsIndex = []
        
        for pairIndex in 0 ..< numberOfCardPair {
            let content = createContent(pairIndex)
            cards.append(Card(content: content, id: 2 * pairIndex))
            cards.append(Card(content: content, id: 2 * pairIndex + 1))
        }
        cards.shuffle()
    }
    
    func GameOver() -> Bool {
        if numberOfmatchedPair == self.numberOfCardPair {
            return true
        }
        return false
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }) {
            if cards[chosenIndex].isMatched {
                return
            }
            if selectedCardsIndex.contains(chosenIndex) {
                return
            }
            
            cards[chosenIndex].isFaceUp = true
            selectedCardsIndex.append(chosenIndex)
            
            if cards[chosenIndex].isFaceUpBefore {
                self.point -= 1
            }
            
            cards[chosenIndex].isFaceUpBefore = true
            
            if selectedCardsIndex.count > 2 {
                cards[selectedCardsIndex[0]].isFaceUp = false
                cards[selectedCardsIndex[1]].isFaceUp = false
                if cards[selectedCardsIndex[0]].content == cards[selectedCardsIndex[1]].content {
                    self.point += 2
                    cards[selectedCardsIndex[0]].isMatched = true
                    cards[selectedCardsIndex[1]].isMatched = true
                    numberOfmatchedPair += 1
                }
                selectedCardsIndex.removeAll()
                selectedCardsIndex.append(chosenIndex)
            }
        }
    }
}
