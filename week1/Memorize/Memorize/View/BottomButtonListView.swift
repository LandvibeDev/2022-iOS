//
//  Memorize.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

struct BottomButtonListView: View {
    
    @EnvironmentObject var gameManager: MemorizeCardGameManger
    
    var body: some View {
        HStack(alignment: .bottom ){
            PlusMinusButtonView(mode: false)
            ThemeButtonListView()
            PlusMinusButtonView(mode: true)
        }
        .foregroundColor(gameManager.currentTheme.themeColor)
    }
    
}


