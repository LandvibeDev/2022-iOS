//
//  ThemeMemoryGame.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/02.
//

import SwiftUI

class ThemeMemoryGame: ObservableObject {
    
    @Published var themeGame = createMemoryGame(createNewTheme())
    var cards: [MemoryGame<String>.Card] {
        return themeGame.cards
    }
    
    static let emojis = createNewTheme().Emojis
    
    
    
    
    static func createMemoryGame(_ theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(theme: theme) { pairIndex in emojis[pairIndex] }
    }
    
    static func createNewTheme() -> Theme {
        let newTheme = Theme.allCases.randomElement()!
        //        var numberOfCardPair = newTheme.randomNumberOfCardPair
        //        if numberOfCardPair > newTheme.Emojis.count {
        //            numberOfCardPair = newTheme.Emojis.count
        //        }
        return newTheme
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        themeGame.choose(card)
    }
    
}
