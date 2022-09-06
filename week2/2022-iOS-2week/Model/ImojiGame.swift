
struct EmojiGame {
    var leftCardSetCount: Int { cards.count - cards.filter {$0.state == .isMatched}.count }
    
    private(set) var cards: [Card]
    private(set) var point: Int
    
    private var isFaceUpCard = false
    
    // MARK: mutating Func
    mutating func changeGameTheme(cardEmojis: [String], displayCardCount: Int) {
        let startIndex = Int.random(in: 1...1000) % cardEmojis.count
        let endIndex = startIndex + displayCardCount
        var newCards = [Card]()
        
        for i in startIndex ... endIndex {
            let index = i % cardEmojis.count
            newCards.append(Card(imoji: cardEmojis[index], id: index * 2 + 1))
            newCards.append(Card(imoji: cardEmojis[index], id: index * 2 ))
        }
        
        point = 0
        cards = newCards.shuffled()
    }
    
    mutating func changeStateCard(cardId: Int) {
        guard let chosenIndex = cards.firstIndex(where: {cardId == $0.id}) else { return }
        if cards[chosenIndex].state == .isMatched { return }
        
        if isFaceUpCard {
            cards[chosenIndex].state.changeCardState()
            calculatePoint()
            isFaceUpCard = false
        }
        else {
            for index in 0 ..< cards.count {
                if cards[index].state != .isFaceDown {
                    cards[index].state.changeCardState()
                }
            }
            isFaceUpCard = true
            cards[chosenIndex].state.changeCardState()
        }
    }
    
    mutating private func calculatePoint() {
      guard let firstCardIndex = cards.firstIndex(where: { $0.state == .isFaceUp }),
            let secondCardIndex = cards.lastIndex(where: { $0.state == .isFaceUp }) else { return }
        
        if cards[firstCardIndex].imoji == cards[secondCardIndex].imoji {
            point += 3
            if leftCardSetCount == 2 {
                cards[firstCardIndex].state = .isMatched
                cards[secondCardIndex].state = .isMatched
                print(leftCardSetCount)
            }
            else {
                cards[firstCardIndex].state = .waitForMatched
                cards[secondCardIndex].state = .waitForMatched
            }
        }
        else if !cards[firstCardIndex].didSelected && !cards[secondCardIndex].didSelected {
            point += 0
        }
        else if cards[firstCardIndex].didSelected && cards[secondCardIndex].didSelected {
            point -= 2
        }
        else {
            point -= 1
        }
        
        cards[firstCardIndex].didSelected = true
        cards[secondCardIndex].didSelected = true
    }
}

// MARK: - extension Nested Struct
extension EmojiGame {
    struct Card: Identifiable, Hashable {
        var didSelected = false
        var state: CardState = .isFaceDown
        var imoji: String
        var id: Int
    }
    
    enum CardState {
        case isFaceUp
        case isFaceDown
        case isMatched
        case waitForMatched
        
        mutating func changeCardState() {
            switch self {
            case .waitForMatched:
                self = .isMatched
            case .isFaceUp:
                self = .isFaceDown
            case .isFaceDown:
                self = .isFaceUp
            case .isMatched:
                self = .isMatched
            }
        }
    }
}

extension EmojiGame {
    struct ConstantContent {
        static let face = ["😀","😍","🤪","🤑","😔","😰","🤯","🤕","🤐","🤩","🤡","🤠","😶","👿","😶‍🌫️","🥶"]
        static let animal = ["🐶","🐭","🐻","🐯","🐨","🐸","🦧","🦊","🦍","🐷","🦁","🦥","🦒"]
        static let sports = ["🏉","🏈","⚽","🏀","⚾","🥎","🎾","🏐","🎱","🥏","🏓","🥅","🪃","🏒","🥍","🥊"]
        static let heart = ["🧡","💔","💙","💜","💛","💚","🤎","🤍","🖤","❤️‍🔥","💝","💗"]
        static let vehicle = ["🚗","🚑","🚙","🚓","🚒","🚕","🛺","🚐","🚌","🛻","🚎","🚚","🏎","🚛","🏍","🛵","🚁"]
        static let outfit = ["👚","🥼","🦺","🧥","👙","🩱","👞","🥿","🥾","🧢","👡","👠","🧦","👘","👗","🧤","🧣","👓"]
        
        static func emit(willChangeTheme theme: Theme.Kind) -> [String] {
            switch theme {
            case .face:
                return face
            case .animal:
                return animal
            case .sports:
                return sports
            case .vehicle:
                return vehicle
            case .heart:
                return heart
            case .outfit:
                return outfit
            }
        }
    }
    
}
