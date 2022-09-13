//
//  MemoryGame.swift
//  Memorize
//
//  Created by Byeongjo Koo on 2022/07/30.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    
    // MARK: Alias(es)
    
    typealias Card = CardSet.Card
    
    // MARK: Property(ies)
    
    private(set) var cardSet: CardSet
    private(set) var points: Int
    var isFinished: Bool {
        cardSet.isAllCardsMatched
    }
    
    // MARK: Initializer(s)
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cardSet = CardSet(numberOfPairsOfCards: numberOfPairsOfCards, createCardContent: createCardContent)
        points = 0
    }
    
    // MARK: Choose Card
    
    mutating func choose(_ card: Card) {
        switch cardSet.choose(card) {
        case .match:
            points += 2
        case .noMatchWithOneSeen:
            points -= 1
        case .noMatchWithBothSeen:
            points -= 2
        case .noMatch: break
        }
    }
    
    mutating func shuffleCards() {
        cardSet.shuffleCards()
    }
}

// MARK: - Card Set

extension MemoryGame {
    
    struct CardSet {
        
        // MARK: Property(ies)
        
        private(set) var cards: [Card]
        private var indexOfOneAndOnlyFaceUpCard: Int? {
            get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
            set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
        }
        var isAllCardsMatched: Bool {
            cards.allSatisfy { $0.isMatched }
        }
        
        // MARK: Initializer(s)
        
        init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
            cards = []
            for index in 0 ..< numberOfPairsOfCards {
                let content = createCardContent(index)
                cards.append(Card(content: content, id: index * 2))
                cards.append(Card(content: content, id: index * 2 + 1))
            }
            cards.shuffle()
        }
        
        // MARK: Method(s)
        
        mutating func choose(_ card: Card) -> MatchResult {
            guard let indexOfChosenCard = cards.index(matching: card),
                  cards[indexOfChosenCard].isFaceUp == false,
                  cards[indexOfChosenCard].isMatched == false
            else { return .noMatch }
            if let indexOfPotentialFaceUpCard = indexOfOneAndOnlyFaceUpCard {
                cards[indexOfChosenCard].isFaceUp = true
                return match(for: indexOfChosenCard, and: indexOfPotentialFaceUpCard)
            } else {
                indexOfOneAndOnlyFaceUpCard = indexOfChosenCard
            }
            return .noMatch
        }
        
        private mutating func match(for lhs: Int, and rhs: Int) -> MatchResult {
            if cards[lhs].content == cards[rhs].content {
                cards[lhs].isMatched = true
                cards[rhs].isMatched = true
                return .match
            } else if cards[lhs].isSeen && cards[rhs].isSeen {
                return .noMatchWithBothSeen
            } else if cards[lhs].isSeen {
                cards[rhs].isSeen = true
                return .noMatchWithOneSeen
            } else if  cards[rhs].isSeen {
                cards[lhs].isSeen = true
                return .noMatchWithOneSeen
            }
            cards[lhs].isSeen = true
            cards[rhs].isSeen = true
            return .noMatch
        }
        
        mutating func shuffleCards() {
            cards.shuffle()
        }
    }
}

// MARK: - Match Result & Card

extension MemoryGame.CardSet {
    
    enum MatchResult {
        
        case match
        case noMatch
        case noMatchWithOneSeen
        case noMatchWithBothSeen
    }
    
    struct Card: Identifiable {
        
        var isFaceUp = false
        var isMatched = false
        var isSeen = false
        let content: CardContent
        let id: Int
    }
}
