enum Theme: String, CaseIterable {
    case animal
    case emotion
    case fruit
    case activity
    case vehicle
    case nation
    case food
    
    static var randomTheme: Theme {
        return Theme.allCases.randomElement() ?? .emotion
    }
    var emojis: [String] {
        let emoji: [String]
        switch self {
        case .animal:
            emoji = ["🐶", "🐱","🐭", "🐰", "🐻", "🐼", "🐨", "🦁", "🐮", "🐷", "🐥", "🦊", "🐵", "🦄", "🦓"]
        case .emotion:
            emoji = ["🥺", "🥸", "🤩", "😜", "🧐", "😤", "😛", "🥳", "🥶", "😓", "🫡", "🫥", "😝", "🤑", "😎"]
        case .fruit:
            emoji = ["🍏", "🍎", "🍐", "🍊", "🍋"]
        case .activity:
            emoji = ["🥎", "🎱", "⚾", "⚽", "🏀", "🏈", "🎾", "🏐", "🏉"]
        case .vehicle:
            emoji = ["🚗", "🚙", "🚕", "🛺", "🚌", "🚎", "🚓", "🏎", "🚑", "🚒", "🚐", "🛻", "🚚", "🏍", "🛵", "🚜"]
        case .nation:
            emoji = ["🇰🇷", "🇦🇨", "🇦🇩", "🇦🇪", "🇦🇫", "🇫🇷", "🇲🇱", "🇧🇷", "🇨🇦", "🇦🇺", "🇬🇹", "🇺🇾", "🇺🇸", "🇺🇬", "🇺🇦"]
        case .food:
            emoji = ["🥓", "🍔", "🍟", "🌭", "🍕", "🍝", "🥪", "🌮", "🌯", "🫔", "🥙", "🧆", "🍜", "🥘", "🍲", "🫕", "🥫", "🍩", "🍿", "🍫", "🍭", "🍮", "🍘", "🍙"]
        }
        return emoji.shuffled()
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

extension Theme {
    enum CardColor {
        case red
        case orange
        case yellow
        case green
        case blue
        case indigo
        case purple
    }
}
