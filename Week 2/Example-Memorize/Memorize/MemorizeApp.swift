//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Byeongjo Koo on 2022/07/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let viewModel = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
