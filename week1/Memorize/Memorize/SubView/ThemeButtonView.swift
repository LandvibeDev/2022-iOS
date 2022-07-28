//
//  ThemeButtonView.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

struct ThemeButtonView: View{
    
    var content: ThemeInfo
    
    @EnvironmentObject var gameManager: MemorizeCardGameManger
    
    var body: some View {
        Button(action: {
            gameManager.currentTheme = content
        }){
            VStack{
                Image(systemName: content.themeRepresentativeImage)
                Text(content.rawValue)
                    .font(.subheadline)
                    .lineLimit(1)
            }
        }
    }
}

