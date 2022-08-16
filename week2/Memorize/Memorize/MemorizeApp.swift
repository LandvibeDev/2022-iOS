//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/02.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    private(set) var memoryGame = ThemeMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            GameBoardView(viewModel: memoryGame)
        }
    }
}
