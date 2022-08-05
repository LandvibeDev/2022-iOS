//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 임주민 on 2022/07/28.
//

import SwiftUI

@main
struct MemorizeApp: App {
  
    var body: some Scene {
        WindowGroup {
          ContentView(viewModel: EmojiMemoryGame())
        }
    }
}
