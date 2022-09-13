//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Byeongjo Koo on 2022/07/30.
//

import SwiftUI

final class EmojiMemoryGame: ObservableObject {
    
    // MARK: Alias(es)
    
    typealias Card = MemoryGame<String>.Card
    
    // MARK: Type Method(s)
    
    private static func createEmojiMemoryGame(of theme: Theme) -> MemoryGame<String> {
        let numberOfPairsOfCards = theme.emojiList.count < theme.numberOfPairsOfCardsToShow
        ? theme.emojiList.count
        : theme.numberOfPairsOfCardsToShow
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { pairIndex in theme.emojiList[pairIndex] }
    }
    
    // MARK: Model(s)
    
    @Published private var theme: Theme {
        didSet {
            game = EmojiMemoryGame.createEmojiMemoryGame(of: theme)
        }
    }
    var themeName: String {
        theme.name.rawValue.capitalized
    }
    var themeColor: Color {
        switch theme.color {
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
    
    @Published private var game: MemoryGame<String>
    var cards: [Card] {
        game.cardSet.cards
    }
    var isFinished: Bool {
        game.isFinished
    }
    var points: String {
        "\(game.points)"
    }
    
    // MARK: Initializer(s)
    
    init() {
        let newTheme = Theme()
        theme = newTheme
        game = EmojiMemoryGame.createEmojiMemoryGame(of: newTheme)
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        game.choose(card)
    }
    
    func createNewGame() {
        theme = Theme()
    }
    
    func shuffleCards() {
        game.shuffleCards()
    }
}
