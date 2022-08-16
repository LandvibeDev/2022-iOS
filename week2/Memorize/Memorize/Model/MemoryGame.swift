//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/02.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var isFaceUpBefore = false
        let content: CardContent
        let id: Int
    }
    
    var cards: [Card]
    var selectedCardsIndex: [Int]
    var point: Int
    var countOfCurrentFaceUpCard: Int
    let numberOfCardPair: Int
    var numberOfMatchedPair: Int
    var theme: Theme
    
    init(theme: Theme, createContent: (Int) -> CardContent) {
        cards = [Card]()
        self.point = 0
        self.theme = theme
        self.numberOfCardPair = theme.numberOfCardPair
        numberOfMatchedPair = 0
        countOfCurrentFaceUpCard = 0
        selectedCardsIndex = []
        
        for pairIndex in 0 ..< numberOfCardPair {
            let content = createContent(pairIndex)
            cards.append(Card(content: content, id: 2 * pairIndex))
            cards.append(Card(content: content, id: 2 * pairIndex + 1))
        }
        cards.shuffle()
    }
    
    func gameOver() -> Bool {
        if numberOfMatchedPair == self.numberOfCardPair {
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
                    numberOfMatchedPair += 1
                }
                selectedCardsIndex.removeAll()
                selectedCardsIndex.append(chosenIndex)
            }
        }
    }
}
