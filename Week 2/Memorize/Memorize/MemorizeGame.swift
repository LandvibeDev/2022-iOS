import SwiftUI

class MemorizeGame: ObservableObject {
    @Published private var model = createEmojiMemoryGame(currentTheme: Theme.randomTheme)
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
    
    static func createEmojiMemoryGame(currentTheme: Theme) -> MemoryGame<String> {
        var numberOfPairsOfCard = currentTheme.numberOfCardsToShow
        if currentTheme.numberOfCardsToShow > currentTheme.emojis.count {
            numberOfPairsOfCard = currentTheme.emojis.count
        }
        return MemoryGame<String>(numberOfPairsOfCard: numberOfPairsOfCard, theme: currentTheme) { pairIndex in currentTheme.emojis[pairIndex]
        }
    }
    func changeTheme(nextTheme: Theme) {
        var numberOfPairsOfCard = nextTheme.numberOfCardsToShow
        if nextTheme.numberOfCardsToShow > nextTheme.emojis.count {
            numberOfPairsOfCard = nextTheme.emojis.count
        }
        model.changeTheme(numberOfPairsOfCard: numberOfPairsOfCard, nextTheme: nextTheme) { pairIndex in
            nextTheme.emojis[pairIndex]
        }
    }
    func changeScore(how: Int) {
        model.score += how
    }
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    func checkGameIsDone() -> Bool {
        if model.numberOfMatchedPairs == model.cards.count {
            return true
        } else {
            return false
        }
    }
}
