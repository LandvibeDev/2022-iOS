
struct ImojiGame {
    private(set) var cards: [Card] = [Card]()
    private(set) var point: Int = 0
    private(set) var shouldFinishThisRound = false
    
    private var openCards: [Int] = [Int]()
    private var completeCardSet: Int = 0
    
    // MARK: mutating Func
    mutating func changeGameByTheme(cardImojis: [String], displayCardCount: Int) {
        let startIndex = Int.random(in: 1...1000) % cardImojis.count
        let endIndex = startIndex + displayCardCount
        var newCards = [Card]()
        
        for i in startIndex ... endIndex {
            let index = i % cardImojis.count
            newCards.append(Card(imoji: cardImojis[index], id: index * 2 + 1))
            newCards.append(Card(imoji: cardImojis[index], id: index * 2 ))
        }
        
        openCards.removeAll()
        shouldFinishThisRound = false
        completeCardSet = 0
        point = 0
        cards = newCards.shuffled()
    }
    
    mutating func toggleCard(_ card: Int) {
        guard let chosenIndex = cards.firstIndex(where: {card == $0.id}) else { fatalError() }
        
        cards[chosenIndex].isFaceUp.toggle()
        
        if openCards.count == 1 {
            openCards.append(chosenIndex)
            calculatePoint()
        }
        else if openCards.count == 2 {
            if cards[openCards[0]].imoji == cards[openCards[1]].imoji {
                cards[openCards[0]].isFaceUp = .isMatched
                cards[openCards[1]].isFaceUp = .isMatched
            }
            for i in 0...1 {
                cards[openCards[i]].isFaceUp.toggle()
                cards[openCards[i]].didSelected = true
            }
            openCards.removeAll()
            openCards.append(chosenIndex)
        }
        else {
            openCards.append(chosenIndex)
        }
    }
    
    mutating private func calculatePoint() {
        if cards[openCards[0]].imoji == cards[openCards[1]].imoji {
            point += 3
            completeCardSet += 1
            if completeCardSet == cards.count / 2 {
                shouldFinishThisRound = true
            }
        }
        else if !cards[openCards[0]].didSelected && !cards[openCards[1]].didSelected {
            point += 0
        }
        else if cards[openCards[0]].didSelected && cards[openCards[1]].didSelected {
            point -= 2
        }
        else {
            point -= 1
        }
    }
}

// MARK: - extension Nested Struct
extension ImojiGame {
    struct Card: Identifiable, Hashable {
        var didSelected = false
        var isFaceUp: CardState = .isFaceDown
        var imoji: String
        var id: Int
    }
}
