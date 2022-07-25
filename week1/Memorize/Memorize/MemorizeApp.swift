//
//  MemorizeApp.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI



@main
struct MemorizeApp: App {
    let gameManager = MemorizeCardGameManger()
    
    var body: some Scene {
        WindowGroup {
            MainGameBoardView().environmentObject(gameManager)
        }
    }
}
