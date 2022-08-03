import Foundation

class MemorizeGame: ObservableObject {
    @Published private var model = createEmojiMemoryGame(nowTheme: Theme.randomTheme)
    var nowOpenedCards = [MemoryGame<String>.Card]()
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    var currentTheme: Theme {
        return model.theme
    }
    var score: Int {
        return model.score
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
