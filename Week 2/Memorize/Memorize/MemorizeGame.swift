import SwiftUI

class MemorizeGame: ObservableObject {
    @Published private var model = createEmojiMemoryGame(nowTheme: Theme.randomTheme)
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    var currentTheme: Theme {
        return model.theme
    }
    var score: Int {
        return model.score
    }
    var themeColor: Color {
        switch currentTheme.cardColor {
        case .red:
            return Color.red
        case .orange:
            return Color.orange
        case .yellow:
            return Color.yellow
        case .green:
            return Color.green
        case .blue:
            return Color.blue
        case .indigo:
            return Color.indigo
        case .purple:
            return Color.purple
        }
    }
    
    static func createEmojiMemoryGame(nowTheme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCard: nowTheme.numberOfCards, theme: nowTheme) { pairIndex in nowTheme.emojis[pairIndex]
        }
    }
    func changeTheme(nextTheme: Theme) {
        model.changeTheme(numberOfPairsOfCard: nextTheme.numberOfCards, nextTheme: nextTheme) { pairIndex in
            nextTheme.emojis[pairIndex]
        }
    }
    func changeScore(how: Int) {
        model.score += how
    }
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
