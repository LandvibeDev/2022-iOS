//
//  ThemeButton.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/07/27.
//

import Foundation
import SwiftUI

struct themeButtonView: View {
    @EnvironmentObject var toBeObserved : ToBeObserved
    var theme: Theme
    var themeName: String
    
    init(theme: Theme, themeName: String)
    {
        self.theme = theme
        self.themeName = themeName
        
    }
    var body: some View {
        Button(action: {
            toBeObserved.changeTheme(newTheme: self.theme)
        }) {
            VStack{
                theme.symbols
                Text("\(themeName)")
                    .fixedSize(horizontal: true, vertical: true)
                    .font(.system(size: 10))
            }
            .font(.system(size: 20))
        }
        
    }
}
