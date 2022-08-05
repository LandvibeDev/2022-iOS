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
        var numberOfPairsOfCards = currentTheme.numberOfPairsOfCardsToShow
        if currentTheme.numberOfPairsOfCardsToShow > currentTheme.emojis.count {
            numberOfPairsOfCards = currentTheme.emojis.count
        }
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards, theme: currentTheme) { pairIndex in currentTheme.emojis.shuffled()[pairIndex]
        }
    }
    func changeTheme(nextTheme: Theme) {
        var numberOfPairsOfCards = nextTheme.numberOfPairsOfCardsToShow
        if nextTheme.numberOfPairsOfCardsToShow > nextTheme.emojis.count {
            numberOfPairsOfCards = nextTheme.emojis.count
        }
        model.changeTheme(numberOfPairsOfCards: numberOfPairsOfCards, nextTheme: nextTheme) { pairIndex in
            nextTheme.emojis.shuffled()[pairIndex]
        }
    }
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    func checkGameIsDone() -> Bool {
        if model.numberOfMatchedPairsOfCards == model.cards.count {
            return true
        } else {
            return false
        }
    }
}
