import SwiftUI

class MemorizeGameDealer: ObservableObject {
    @Published private var memorizeGameManager = createEmojiMemoryGame()
    var cards: [MemorizeGame<String>.Card] {
        return memorizeGameManager.cards
    }
    var currentTheme: Theme {
        return memorizeGameManager.theme
    }
    var score: Int {
        return memorizeGameManager.score
    }
    var currentThemeName: String {
        return memorizeGameManager.theme.rawValue
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
        return MemorizeGame<String>(numberOfPairsOfCards: numberOfPairsOfCards, theme: currentTheme) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    func newGame() {
        let nextTheme = Theme.randomTheme
        var numberOfPairsOfCards = nextTheme.numberOfPairsOfCardsToShow
        let emojis = nextTheme.emojis
        
        if nextTheme.numberOfPairsOfCardsToShow > emojis.count {
            numberOfPairsOfCards = emojis.count
        }
        memorizeGameManager.newGame(numberOfPairsOfCards: numberOfPairsOfCards, nextTheme: nextTheme) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    func choose(card: MemorizeGame<String>.Card) {
        memorizeGameManager.choose(card: card)
    }
}
