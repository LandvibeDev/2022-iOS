import SwiftUI

class MemorizeGameDealer: ObservableObject {
    @Published private var memorizeGameManager = createEmojiMemoryGame()
    private var theme = Theme.randomTheme
    var cards: [MemorizeGame<String>.Card] {
        return memorizeGameManager.cards
    }
    var currentTheme: Theme {
        return theme
    }
    var score: Int {
        return memorizeGameManager.score
    }
    var currentThemeName: String {
        return theme.rawValue
    }
    var gameIsFinished: Bool {
        return memorizeGameManager.numberOfMatchedPairsOfCards == memorizeGameManager.cards.count / 2
    }
    var themeColor: Color {
        switch currentTheme.cardColor {
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
    
    private static func createEmojiMemoryGame(currentTheme: Theme = .randomTheme) -> MemorizeGame<String> {
        var numberOfPairsOfCards = currentTheme.numberOfPairsOfCardsToShow
        let emojis = currentTheme.emojis
        
        if currentTheme.numberOfPairsOfCardsToShow > emojis.count {
            numberOfPairsOfCards = emojis.count
        }
        return MemorizeGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    func newGame() {
        theme = Theme.randomTheme
        var numberOfPairsOfCards = theme.numberOfPairsOfCardsToShow
        let emojis = theme.emojis
        
        if theme.numberOfPairsOfCardsToShow > emojis.count {
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
