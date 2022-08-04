import Foundation

struct MemoryGame<CardContent: Equatable> {
    var cards: [Card]
    var theme: Theme
    var nowOpendCard: [Card] = []
    var score = 0
    var numberOfMatchedPairs = 0
    init(numberOfPairsOfCard: Int, theme: Theme, createContent: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0 ..< numberOfPairsOfCard {
            let content = createContent(pairIndex)
            cards.append(Card(content: content, id: 2 * pairIndex))
            cards.append(Card(content: content, id: 2 * pairIndex + 1))
        }
        cards = cards.shuffled()
        self.theme = theme
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if nowOpendCard.count == 1 && nowOpendCard[0].id == card.id {
                return
            }
            cards[chosenIndex].isFaceUp.toggle()
            nowOpendCard.append(card)
            if nowOpendCard.count == 3 {
                for index in 0 ... 1 {
                    nowOpendCard[index].isFaceUp.toggle()
                }
                nowOpendCard.removeSubrange(0 ... 1)
            }
            if nowOpendCard.count == 2 {
                if nowOpendCard[0].content == nowOpendCard[1].content && abs(nowOpendCard[0].id - nowOpendCard[1].id) == 1 {
                    score += 2
                    for index in 0 ... 1 {
                        nowOpendCard[index].isMatched = true
                        numberOfMatchedPairs += 1
                    }
                }
                else {
                    for index in 0 ... 1 {
                        if nowOpendCard[index].isOpend {
                            score -= 1
                        }
                        nowOpendCard[index].isOpend = true
                    }
                }
            }
        }
    }
    mutating func changeTheme(numberOfPairsOfCard: Int, nextTheme: Theme, createContent: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0 ..< numberOfPairsOfCard {
            let content = createContent(pairIndex)
            cards.append(Card(content: content, id: 2 * pairIndex))
            cards.append(Card(content: content, id: 2 * pairIndex + 1))
        }
        theme = nextTheme
        cards = cards.shuffled()
        score = 0
        nowOpendCard = []
        numberOfMatchedPairs = 0
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
