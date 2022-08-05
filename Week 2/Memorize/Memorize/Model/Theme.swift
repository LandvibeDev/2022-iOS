enum Theme: String {
    case animal = "animal"
    case emotion = "emotion"
    case fruit = "fruit"
    case activity = "activity"
    case vehicle = "vehicle"
    case nation = "nation"
    case food = "food"
    
    var emojis: [String] {
        switch self {
        case .animal:
            return ["🐶", "🐱","🐭", "🐰", "🐻", "🐼", "🐨", "🦁", "🐮", "🐷", "🐥", "🦊", "🐵", "🦄", "🦓"]
        case .emotion:
            return ["🥺", "🥸", "🤩", "😜", "🧐", "😤", "😛", "🥳", "🥶", "😓", "🫡", "🫥", "😝", "🤑", "😎", "🤓", "🤠",  "🤡", "😏", "😶", "😐", "🫤", "😑", "😒", "🙄", "🤨", "🤔", "🤫"]
        case .fruit:
            return ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈"]
        case .activity:
            return ["🥎", "🎱", "⚾", "⚽", "🏀", "🏈", "🎾", "🏐", "🏉"]
        case .vehicle:
            return ["🚗", "🚙", "🚕", "🛺", "🚌", "🚎", "🚓", "🏎", "🚑", "🚒", "🚐", "🛻", "🚚", "🏍", "🛵", "🚜"]
        case .nation:
            return ["🇰🇷", "🇦🇨", "🇦🇩", "🇦🇪", "🇦🇫", "🇫🇷", "🇲🇱", "🇧🇷", "🇨🇦", "🇦🇺", "🇬🇹", "🇺🇾", "🇺🇸", "🇺🇬", "🇺🇦"]
        case .food:
            return ["🥓", "🍔", "🍟", "🌭", "🍕", "🍝", "🥪", "🌮", "🌯", "🫔", "🥙", "🧆", "🍜", "🥘", "🍲", "🫕", "🥫", "🍩", "🍿", "🍫", "🍭", "🍮", "🍘", "🍙"]
        }
    }
    var maxNumber: Int {
        return self.emojis.count
    }
}

