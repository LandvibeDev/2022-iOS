//
//  MemoryGame.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/08/02.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    var theme: Theme
    init(numberOfPairsOfCard: Int, theme: Theme, createContent: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0 ..< numberOfPairsOfCard {
            let content = createContent(pairIndex)
            cards.append(Card(content: content, id: 2 * pairIndex))
            cards.append(Card(content: content, id: 2 * pairIndex + 1))
        }
        self.theme = theme
        print(theme)
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    mutating func changeTheme(numberOfPairsOfCard: Int, nextTheme: Theme, createContent: (Int) -> CardContent)
    {
        cards = [Card]()
        for pairIndex in 0 ..< numberOfPairsOfCard {
            let content = createContent(pairIndex)
            cards.append(Card(content: content, id: 2 * pairIndex))
            cards.append(Card(content: content, id: 2 * pairIndex + 1))
        }
        theme = nextTheme
    }
    
    class Card: Identifiable, ObservableObject {
        @Published var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
        init(content: CardContent, id: Int)
        {
            self.content = content
            self.id = id
        }
    }
}
