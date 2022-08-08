import Foundation

struct MemorizeGame<CardContent: Equatable> {
    private(set) var cards: [Card] = []
    private(set) var theme: Theme
    private(set) var score = 0
    var currentOpenedCards: [Card] = []
    var numberOfMatchedPairsOfCards: Int {
        cards.filter({ $0.isMatched }).count / 2
    }
    
    init(numberOfPairsOfCards: Int, theme: Theme, createContent: (Int) -> CardContent) {
        self.theme = theme
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content = createContent(pairIndex)
            cards.append(Card(content: content, id: 2 * pairIndex))
            cards.append(Card(content: content, id: 2 * pairIndex + 1))
        }
        cards = cards.shuffled()
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if currentOpenedCards.count == 1 && currentOpenedCards[0].id == card.id {
                return
            }
            cards[chosenIndex].isFaceUp = true
            currentOpenedCards.append(card)
        }
        if currentOpenedCards.count == 3 {
            for _ in 0 ... 1 {
                if let someIndex = cards.firstIndex(where: { $0.id == currentOpenedCards.first?.id }) {
                    cards[someIndex].isFaceUp = false
                }
                currentOpenedCards.remove(at: 0)
            }
        }
        if currentOpenedCards.count == 2 {
            if currentOpenedCards.first?.content == currentOpenedCards.reversed().first?.content {
                score += 2
                if let someIndex = cards.firstIndex(where: { $0.id == currentOpenedCards.first?.id }) {
                    cards[someIndex].isMatched = true
                }
                if let someIndex = cards.firstIndex(where: { $0.id == currentOpenedCards.reversed().first?.id }) {
                    cards[someIndex].isMatched = true
                }
            }
            else {
                if let someBool = currentOpenedCards.first {
                    if someBool.isFaceUpAtLeastOnce {
                        score -= 1
                    }
                }
                if let someBool = currentOpenedCards.reversed().first {
                    if someBool.isFaceUpAtLeastOnce {
                        score -= 1
                    }
                }
                if let someIndex = cards.firstIndex(where: { $0.id == currentOpenedCards.first?.id }) {
                    cards[someIndex].isFaceUpAtLeastOnce = true
                }
                if let someIndex = cards.firstIndex(where: { $0.id == currentOpenedCards.reversed().first?.id }) {
                    cards[someIndex].isFaceUpAtLeastOnce = true
                }
            }
        }
        
    }
    
    mutating func newGame(numberOfPairsOfCards: Int, nextTheme: Theme, createContent: (Int) -> CardContent) {
        cards = [Card]()
        score = 0
        currentOpenedCards = []
        theme = nextTheme
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content = createContent(pairIndex)
            cards.append(Card(content: content, id: 2 * pairIndex))
            cards.append(Card(content: content, id: 2 * pairIndex + 1))
        }
        cards = cards.shuffled()
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var isFaceUpAtLeastOnce = false
        let content: CardContent
        var id: Int
    }
}
