//
//  ThemeMemoryGame.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/02.
//

import SwiftUI

class ThemeMemoryGame: ObservableObject {
    
    @Published var memoryGame = createMemoryGame()
    static var theme = Theme.createNewTheme()
    
    static let emojis = theme.Emojis
    var numberOfCardPair = theme.numberOfCardPair
//
//    var color: Color {
//        switch theme.color {
//        case .orange:
//            return .orange
//        case .red:
//            return .red
//        }
//    }
    
   
    var cards: [MemoryGame<String>.Card] {
        return memoryGame.cards
    }
    

    
        
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(theme: theme) { pairIndex in emojis[pairIndex] }
    }
    
    
//    static func createTheme() -> Theme {
//
//    }
    
    
    
    func choose(_ card: MemoryGame<String>.Card) {
        memoryGame.choose(card)
    }
    
}
