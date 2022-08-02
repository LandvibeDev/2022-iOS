enum Theme: String {
    case animal = "animal"
    case emotion = "emotion"
    case fruit = "fruit"
    
    var emojis: [String] {
        switch self {
        case .animal:
            return ["🐶", "🐱","🐭", "🐰", "🐻", "🐼", "🐨", "🦁", "🐮", "🐷", "🐥", "🦊", "🐵", "🦄", "🦓" ]
        case .emotion:
            return ["🥺", "🥸", "🤩", "😜", "🧐", "😤", "😛", "🥳", "🥶", "😓", "🫡", "🫥", "😝", "🤑", "😎", "🤓", "🤠",  "🤡", "😏", "😶", "😐", "🫤", "😑", "😒", "🙄", "🤨", "🤔", "🤫"]
        case .fruit:
            return ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈"]
        }
    }
    var symbol: String {
        switch self {
        case .animal:
            return "pawprint.circle"
        case .emotion:
            return "face.smiling"
        case .fruit:
            return "applelogo"
        }
    }
    var maxNumber: Int {
        return self.emojis.count
    }
}

