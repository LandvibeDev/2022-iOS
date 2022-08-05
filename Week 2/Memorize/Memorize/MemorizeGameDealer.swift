import SwiftUI

class MemorizeGameDealer: ObservableObject {
    @Published private var model = createEmojiMemoryGame(currentTheme: Theme.randomTheme)
    var cards: [MemorizeGame<String>.Card] {
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
    
    static func createEmojiMemoryGame(currentTheme: Theme) -> MemorizeGame<String> {
        var numberOfPairsOfCards = currentTheme.numberOfPairsOfCardsToShow
        let constantEmojis = currentTheme.emojis
        
        if currentTheme.numberOfPairsOfCardsToShow > currentTheme.emojis.count {
            numberOfPairsOfCards = currentTheme.emojis.count
        }
        return MemorizeGame<String>(numberOfPairsOfCards: numberOfPairsOfCards, theme: currentTheme) { pairIndex in
            constantEmojis[pairIndex]
        }
    }
    func changeTheme(nextTheme: Theme) {
        var numberOfPairsOfCards = nextTheme.numberOfPairsOfCardsToShow
        let constantEmojis = nextTheme.emojis
        
        if nextTheme.numberOfPairsOfCardsToShow > nextTheme.emojis.count {
            numberOfPairsOfCards = nextTheme.emojis.count
        }
        model.changeTheme(numberOfPairsOfCards: numberOfPairsOfCards, nextTheme: nextTheme) { pairIndex in
            constantEmojis[pairIndex]
        }
    }
    func choose(card: MemorizeGame<String>.Card) {
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