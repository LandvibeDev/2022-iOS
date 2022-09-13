//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Byeongjo Koo on 2022/07/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
