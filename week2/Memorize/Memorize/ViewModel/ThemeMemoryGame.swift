//
//  ThemeMemoryGame.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/02.
//

import SwiftUI

class ThemeMemoryGame: ObservableObject {
    struct Theme {
        var cards: [String]
        var theme: String
        var color: Color
    }
    
    static let emojis = ["🥺", "🥸", "🤩", "😜", "🧐", "😤", "😛", "🥳", "🥶", "😓", "🫡", "🫥"]
    
    static func createThemeMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsofCard: 12) { pairIndex in emojis[pairIndex] }
    }
    
    @Published private var model = createThemeMemoryGame()
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }

    // MARK: - Intent(s)

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    //        func getTheme(_ theme: String) -> Theme {
    //            switch theme {
    //            case "Halloween":
    //                return Theme(theme: theme, color: .orange)
    //            case "Sports":
    //                return Theme(theme: theme, color: .blue)
    //            case "Nature":
    //                return Theme(theme: theme, color: .green)
    //            case "Animal":
    //                return Theme(theme: theme, color: .yellow)
    //            case "Vehicle":
    //                return Theme(theme: theme, color: .red)
    //            case "Face":
    //                return Theme(theme: theme, color: .purple)
    //            case "Flag":
    //                return Theme(theme: theme, color: .cyan)
    //            default:
    //                return Theme(theme: theme, color: .black)
    //            }
    //        }
}
