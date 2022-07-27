//
//  FooterVIew.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/07/26.
//

import SwiftUI

struct FooterVIew: View {

    @EnvironmentObject var toBeObserved : ToBeObserved
    var body: some View {
        HStack{
            calculateButtonView(isPlus: false)
                .padding()
            themeButtonView(theme: .animal, themeName: "animal")
                .padding()
            themeButtonView(theme: .emotion, themeName: "emotion")
                .padding()
            themeButtonView(theme: .fruit, themeName: "fruit")
                .padding()
            calculateButtonView(isPlus: true)
                .padding()
        }
        .font(.largeTitle)
        .padding()
        
    }
}

struct FooterVIew_Previews: PreviewProvider {
    static var previews: some View {
        FooterVIew()
    }
}
