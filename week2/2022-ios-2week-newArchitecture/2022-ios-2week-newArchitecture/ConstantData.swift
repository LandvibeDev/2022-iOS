
struct ConstantImojiContent {
    static let face = ["😀","😍","🤪","🤑","😔","😰","🤯","🤕","🤐","🤩","🤡","🤠","😶","👿","😶‍🌫️","🥶"]
    static let animal = ["🐶","🐭","🐻","🐯","🐨","🐸","🦧","🦊","🦍","🐷","🦁","🦥","🦒"]
    static let sports = ["🏉","🏈","⚽","🏀","⚾","🥎","🎾","🏐","🎱","🥏","🏓","🥅","🪃","🏒","🥍","🥊"]
    static let heart = ["🧡","💔","💙","💜","💛","💚","🤎","🤍","🖤","❤️‍🔥","💝","💗"]
    static let vehicle = ["🚗","🚑","🚙","🚓","🚒","🚕","🛺","🚐","🚌","🛻","🚎","🚚","🏎","🚛","🏍","🛵","✈🚁"]
    static let outfit = ["👚","🥼","🦺","🧥","👙","🩱","👞","🥿","🥾","🧢","👡","👠","🧦","👘","👗","🧤","🧣","👓"]
    
    static func emitImoji(willChangeTheme theme: ThemeModel.Detail) -> [String] {
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

