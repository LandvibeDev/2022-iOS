//
//  ContentView.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

struct MainGameBoardView: View {
    
    @EnvironmentObject var gameManager: MemorizeCardGameManger
    
    var body: some View {
        VStack{
            TitleView()
                .foregroundColor(gameManager.currentTheme.themeColor)
            CardListView()
            BottomButtonListView()
        }
        .padding()
    }
}

struct MainGameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        MainGameBoardView()
    }
}
