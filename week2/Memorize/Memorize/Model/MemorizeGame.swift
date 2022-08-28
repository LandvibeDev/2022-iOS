import Foundation

struct MemorizeGame<CardContent: Equatable> {
    private(set) var cards: [Card] = []
    private(set) var score = 0
    private var currentOpenedCards: [Card] = []
    var isFinished: Bool {
        cards.filter({ $0.isMatched }).count / 2 == cards.count / 2
    }
    
    init(numberOfPairsOfCards: Int, createContent: (Int) -> CardContent) {
        cards = makeCards(numberOfPairsOfCards: numberOfPairsOfCards, createContent: createContent)
    }
    
    func makeCards(numberOfPairsOfCards: Int, createContent: (Int) -> CardContent) -> [Card] {
        var cards: [Card] = []
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content = createContent(pairIndex)
            cards.append(Card(content: content, id: 2 * pairIndex))
            cards.append(Card(content: content, id: 2 * pairIndex + 1))
        }
        return cards.shuffled()
    }
    
    mutating func newGame(numberOfPairsOfCards: Int, createContent: (Int) -> CardContent) {
        score = 0
        currentOpenedCards = []
        cards = makeCards(numberOfPairsOfCards: numberOfPairsOfCards, createContent: createContent)
    }
    
    mutating func choose(card: Card) {
        faceUpCardAftercheck(card: card)
        faceDownTwoCards()
        calculateScore()
    }
    
    mutating private func faceUpCardAftercheck(card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if currentOpenedCards.count == 1 && currentOpenedCards.first?.id == card.id { return }
            cards[chosenIndex].isFaceUp = true
            currentOpenedCards.append(card)
        }
    }
    
    mutating private func faceDownTwoCards() {
        guard currentOpenedCards.count == 3 else { return }
        for _ in 0 ... 1 {
            if let chosenIndex = cards.firstIndex(where: { $0.id == currentOpenedCards.first?.id }) {
                cards[chosenIndex].isFaceUp = false
            }
            currentOpenedCards.remove(at: 0)
        }
    }
    
    mutating private func calculateScore() {
        guard currentOpenedCards.count == 2 else { return }
        if currentOpenedCards.first?.content == currentOpenedCards.reversed().first?.content {
            score += 2
            currentOpenedCards.forEach { opendCard in
                if let chosenIndex = cards.firstIndex(where: { $0.id == opendCard.id }) {
                    cards[chosenIndex].isMatched = true
                }
            }
        }
        else {
            currentOpenedCards.forEach { opendCard in
                if opendCard.isFaceUpAtLeastOnce == true {
                    score -= 1
                }
                if let chosenIndex = cards.firstIndex(where: { $0.id == opendCard.id }) {
                    cards[chosenIndex].isFaceUpAtLeastOnce = true
                }
            }
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var isFaceUpAtLeastOnce = false
        let content: CardContent
        let id: Int
    }
}
