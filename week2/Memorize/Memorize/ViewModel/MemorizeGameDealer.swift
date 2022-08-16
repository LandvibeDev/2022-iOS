import SwiftUI

class MemorizeGameDealer: ObservableObject {
    @Published private var memorizeGameManager = createEmojiMemoryGame()
    private static var theme = Theme.randomTheme
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
        return memorizeGameManager.isFinished
    }
    var themeColor: Color {
        return currentTheme.color
    }
    
    private static func createEmojiMemoryGame() -> MemorizeGame<String> {
        theme = .randomTheme
        var numberOfPairsOfCards = theme.numberOfPairsOfCardsToShow
        let emojis = theme.emojis
        if theme.numberOfPairsOfCardsToShow > emojis.count {
            numberOfPairsOfCards = emojis.count
        }
        return MemorizeGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    func newGame() {
        Self.theme = .randomTheme
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
