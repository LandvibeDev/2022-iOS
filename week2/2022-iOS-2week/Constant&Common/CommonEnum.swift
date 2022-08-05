
enum CardState {
    case isFaceUp
    case isFaceDown
    case isMatched
    
    mutating func toggle() {
        switch self {
        case .isFaceUp:
            self = .isFaceDown
        case .isFaceDown:
            self = .isFaceUp
        case .isMatched:
            self = .isMatched
        }
    }
}

