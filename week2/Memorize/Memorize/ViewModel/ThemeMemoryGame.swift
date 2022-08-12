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


    var color: Color {
        switch ThemeMemoryGame.theme.color {
        case .orange:
            return .orange
        case .blue:
            return .blue
        case .green:
            return .green
        case .yellow:
            return .yellow
        case .red:
            return .red
        case .purple:
            return .purple
        case .cyan:
            return .cyan
        case .black:
            return .black
        }
    }
    
    var point: Int {
        return memoryGame.point
    }
    
    var title: Theme {
        return memoryGame.theme
    }
    
   
    var cards: [MemoryGame<String>.Card] {
        return memoryGame.cards
    }
    
//    func newGame() -> MemoryGame<String> {
//        theme = Theme.createNewTheme()
//        memoryGame = memoryGame<String>(theme: theme) {pairIndex in emojis[pairIndex]}
//    }
        
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(theme: theme) { pairIndex in emojis[pairIndex] }
    }
    

    
    
    
    func choose(_ card: MemoryGame<String>.Card) {
        memoryGame.choose(card)
    }
    
}
