//
//  Memorize.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

struct MemorizeButtonListView: View {
    
    @EnvironmentObject var gameManager: MemorizeCardGameManger
    
    var body: some View {
        
        HStack(alignment: .top){
            PlusMinusButtonVIew(mode: false)
            ThemeButtonListView()
            PlusMinusButtonVIew(mode: true)
        }
        .foregroundColor( gameManager.currentTheme.themeColor )
        
    }
    
}

struct MemorizeButtonListVIew_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeButtonListView()
    }
}
