//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/02.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let viewModel = ThemeMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            GameBoardView(viewModel: viewModel)
        }
    }
}
