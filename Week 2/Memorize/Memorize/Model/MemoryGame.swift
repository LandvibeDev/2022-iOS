import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: [Card]
    private(set) var theme: Theme
    private(set) var currentOpenedCards: [Card] = []
    private(set) var score = 0
    private(set) var numberOfMatchedPairsOfCards = 0
    
    init(numberOfPairsOfCards: Int, theme: Theme, createContent: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content = createContent(pairIndex)
            cards.append(Card(content: content, id: 2 * pairIndex))
            cards.append(Card(content: content, id: 2 * pairIndex + 1))
        }
        cards = cards.shuffled()
        self.theme = theme
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if currentOpenedCards.count == 1 && currentOpenedCards[0].id == card.id {
                return
            }
            cards[chosenIndex].isFaceUp.toggle()
            currentOpenedCards.append(card)
            if currentOpenedCards.count == 3 {
                for index in 0 ... 1 {
                    currentOpenedCards[index].isFaceUp.toggle()
                }
                currentOpenedCards.removeSubrange(0 ... 1)
            }
            if currentOpenedCards.count == 2 {
                if currentOpenedCards[0].content == currentOpenedCards[1].content && abs(currentOpenedCards[0].id - currentOpenedCards[1].id) == 1 {
                    score += 2
                    for index in 0 ... 1 {
                        currentOpenedCards[index].isMatched = true
                        numberOfMatchedPairsOfCards += 1
                    }
                }
                else {
                    for index in 0 ... 1 {
                        if currentOpenedCards[index].isOpend {
                            score -= 1
                        }
                        currentOpenedCards[index].isOpend = true
                    }
                }
            }
        }
    }
    mutating func changeTheme(numberOfPairsOfCards: Int, nextTheme: Theme, createContent: (Int) -> CardContent) {
        cards = [Card]()
        score = 0
        currentOpenedCards = []
        numberOfMatchedPairsOfCards = 0
        theme = nextTheme
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content = createContent(pairIndex)
            cards.append(Card(content: content, id: 2 * pairIndex))
            cards.append(Card(content: content, id: 2 * pairIndex + 1))
        }
        cards = cards.shuffled()
    }
    
    class Card: Identifiable, ObservableObject {
        @Published var isFaceUp = false
        var isMatched = false
        var isOpend = false
        let content: CardContent
        let id: Int
        
        init(content: CardContent, id: Int) {
            self.content = content
            self.id = id
        }
    }
}
