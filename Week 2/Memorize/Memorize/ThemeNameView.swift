//
//  ThemeNameView.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/08/02.
//

import SwiftUI

struct ThemeNameView: View {
    @EnvironmentObject var memorizeGame: MemorizeGame
    
    var body: some View {
        Text("\(memorizeGame.currentTheme.rawValue)")
            .font(.largeTitle)
            .foregroundColor(.black)
    }
}

struct ThemeNameView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeNameView()
    }
}
