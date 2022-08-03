import Foundation

class MemorizeGame: ObservableObject {
    @Published private var model = createEmojiMemoryGame(nowTheme: Theme.randomTheme)
    var cards: [MemoryGame<String>.Card] {
        model.cards.shuffled()
    }
    var currentTheme: Theme {
        return model.theme
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
}
