enum Theme: String, CaseIterable {
    case animal = "animal"
    case emotion = "emotion"
    case fruit = "fruit"
    case activity = "activity"
    case vehicle = "vehicle"
    case nation = "nation"
    case food = "food"
    
    static var randomTheme: Theme {
        return Theme.allCases.randomElement() ?? .emotion
    }
    var emojis: [String] {
        switch self {
        case .animal:
            return ["🐶", "🐱","🐭", "🐰", "🐻", "🐼", "🐨", "🦁", "🐮", "🐷", "🐥", "🦊", "🐵", "🦄", "🦓"].shuffled()
        case .emotion:
            return ["🥺", "🥸", "🤩", "😜", "🧐", "😤", "😛", "🥳", "🥶", "😓", "🫡", "🫥", "😝", "🤑", "😎"].shuffled()
        case .fruit:
            return ["🍏", "🍎", "🍐", "🍊", "🍋"].shuffled()
        case .activity:
            return ["🥎", "🎱", "⚾", "⚽", "🏀", "🏈", "🎾", "🏐", "🏉"].shuffled()
        case .vehicle:
            return ["🚗", "🚙", "🚕", "🛺", "🚌", "🚎", "🚓", "🏎", "🚑", "🚒", "🚐", "🛻", "🚚", "🏍", "🛵", "🚜"].shuffled()
        case .nation:
            return ["🇰🇷", "🇦🇨", "🇦🇩", "🇦🇪", "🇦🇫", "🇫🇷", "🇲🇱", "🇧🇷", "🇨🇦", "🇦🇺", "🇬🇹", "🇺🇾", "🇺🇸", "🇺🇬", "🇺🇦"].shuffled()
        case .food:
            return ["🥓", "🍔", "🍟", "🌭", "🍕", "🍝", "🥪", "🌮", "🌯", "🫔", "🥙", "🧆", "🍜", "🥘", "🍲", "🫕", "🥫", "🍩", "🍿", "🍫", "🍭", "🍮", "🍘", "🍙"].shuffled()
        }
    }
    var cardColor: CardColor {
        switch self {
        case .animal:
            return .red
        case .emotion:
            return .orange
        case .fruit:
            return .yellow
        case .activity:
            return .green
        case .vehicle:
            return .blue
        case .nation:
            return .indigo
        case .food:
            return .purple
        }
    }
    var numberOfPairsOfCardsToShow: Int {
        switch self {
        case .nation:
            return 8
        case .fruit:
            return 7
        case .vehicle:
            return 5
        default:
            return self.emojis.count
        }
    }
}

