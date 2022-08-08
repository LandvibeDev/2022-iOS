import SwiftUI

class MemorizeGameDealer: ObservableObject {
    @Published private var memorizeGameManager = createEmojiMemoryGame()
    static private var theme = Theme.randomTheme
    var cards: [MemorizeGame<String>.Card] {
        return memorizeGameManager.cards
    }
    var currentTheme: Theme {
        return Self.theme
    }
    var score: Int {
        return memorizeGameManager.score
    }
    var currentThemeName: String {
        return Self.theme.rawValue
    }
    var isFinished: Bool {
        return memorizeGameManager.numberOfMatchedPairsOfCards == memorizeGameManager.cards.count / 2
    }
    var themeColor: Color {
        switch currentTheme.themeColor {
        case .red:
            return .red
        case .orange:
            return .orange
        case .yellow:
            return .yellow
        case .green:
            return .green
        case .blue:
            return .blue
        case .indigo:
            return .indigo
        case .purple:
            return .purple
        }
    }
    
    private static func createEmojiMemoryGame() -> MemorizeGame<String> {
        Self.theme = .randomTheme
        var numberOfPairsOfCards = Self.theme.numberOfPairsOfCardsToShow
        let emojis = Self.theme.emojis
        if Self.theme.numberOfPairsOfCardsToShow > emojis.count {
            numberOfPairsOfCards = emojis.count
        }
        return MemorizeGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    func newGame() {
        Self.theme = Theme.randomTheme
        var numberOfPairsOfCards = Self.theme.numberOfPairsOfCardsToShow
        let emojis = Self.theme.emojis
        
        if Self.theme.numberOfPairsOfCardsToShow > emojis.count {
            numberOfPairsOfCards = emojis.count
        }
        memorizeGameManager.newGame(numberOfPairsOfCards: numberOfPairsOfCards) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    func choose(card: MemorizeGame<String>.Card) {
        memorizeGameManager.choose(card: card)
    }
}
