//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/02.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: [Card]
    
    init(numberOfPairsofCard: Int, createContent: (Int) -> CardContent) {
        cards = [Card]()
        
        for pairIndex in 0 ..< numberOfPairsofCard {
            let content = createContent(pairIndex)
            cards.append(Card(content: content, id: 2 * pairIndex))
            cards.append(Card(content: content, id: 2 * pairIndex + 1))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    func newGame(_ numberOfCards: Int, _ cards: [Card]) {
        
    }
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
        var id: Int
        
        
    }
}
