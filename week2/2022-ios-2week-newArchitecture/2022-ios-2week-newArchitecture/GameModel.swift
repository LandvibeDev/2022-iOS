
import Combine

struct GameModel {
    private var openCard: [Int] = [Int]()
    private var finishSet: Int = 0
    
    private(set) var cards: [Card]
    private(set) var point: Int = 0
    private(set) var finishThisRound = false
    
    init(){
        var newCards = [Card]()
        
        ConstantImojiContent.emitImoji(willChangeTheme: .face).enumerated().forEach { index, imoji in
            newCards.append(Card(imoji: imoji, id: index * 2 + 1))
            newCards.append(Card(imoji: imoji, id: index * 2 ))
        }
        
        cards = newCards.shuffled()
    }
    
    // MARK: mutating Func
    mutating func changeGameMangeByTheme(cardImojis: [String], displayCardCount: Int) {
        let startIndex = Int.random(in: 1...1000) % cardImojis.count
        let endIndex = startIndex + displayCardCount
        var newCards = [Card]()
        
        for i in startIndex ... endIndex {
            let index = i % cardImojis.count
            newCards.append(Card(imoji: cardImojis[index], id: index * 2 + 1))
            newCards.append(Card(imoji: cardImojis[index], id: index * 2 ))
        }
        
        openCard.removeAll()
        finishThisRound = false
        finishSet = 0
        point = 0
        cards = newCards.shuffled()
    }
    
    mutating func toggleCard(_ card: Int, _ secondCard: Int = 0) {
        print(card)
        guard let leftIndex = cards.firstIndex(where: { $0.id == card }) else { fatalError() }
        guard secondCard != 0,
              let rightIndex = cards.firstIndex(where: { $0.id == secondCard }) else { fatalError() }
        
        cards[leftIndex].isFaceUp.toggle()
        cards[rightIndex].isFaceUp.toggle()
    }
    
    func calculatePoint(_ lhs: Int, _ rhs: Int) -> Int {
        guard let leftIndex = cards.firstIndex(where: { $0.id == lhs }),
              let rightIndex = cards.firstIndex(where: { $0.id == rhs }) else { fatalError() }
        
        if cards[leftIndex].imoji == cards[rightIndex].imoji {
            return 3
        }
        else if !cards[leftIndex].didSelected && !cards[rightIndex].didSelected {
            return 0
        }
        else if cards[leftIndex].didSelected && cards[rightIndex].didSelected {
            return 2
        }
        else {
            return 1
        }
    }
}

// MARK: - extension Nested Struct
extension GameModel {
    struct Card: Identifiable, Hashable {
        var didSelected = false
        var isMatched = false
        var isFaceUp: FaceUp = .isFaceDown
        var imoji: String
        var id: Int
    }
}

enum FaceUp {
    case isFaceUp
    case isFaceDown
    
    mutating func toggle() {
        switch self {
        case .isFaceUp:
            self = .isFaceDown
        case .isFaceDown:
            self = .isFaceDown
        }
    }
}
