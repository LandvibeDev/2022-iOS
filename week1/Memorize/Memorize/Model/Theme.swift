import SwiftUI
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
    var symbol: Image {
        switch self {
        case .animal:
            return Image(systemName: "pawprint.circle")
        case .emotion:
            return Image(systemName: "face.smiling")
        case .fruit:
            return Image(systemName: "applelogo")
        }
    }
    var maxNumber: Int {
        return self.emojis.count
    }
}

