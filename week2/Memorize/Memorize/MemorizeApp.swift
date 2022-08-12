//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 임주민 on 2022/07/28.
//

import SwiftUI

@main
struct MemorizeApp: App {
  
  let memoryGameManager = EmojiMemoryGame()
  
    var body: some Scene {
        WindowGroup {
          ContentView(memoryGameManager: memoryGameManager)
        }
    }
}
