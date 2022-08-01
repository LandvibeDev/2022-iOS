//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Byeongjo Koo on 2022/07/31.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🥺", "🥸", "🤩", "😜", "🧐", "😤", "😛", "🥳", "🥶", "😓", "🫡", "🫥"]
    
    static func createEmojiMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCard: 5) { pairIndex in emojis[pairIndex] }
    }
    
    @Published private var model = createEmojiMemoryGame()
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
