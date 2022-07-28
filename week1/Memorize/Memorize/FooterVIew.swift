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
            CalculateButtonView(isPlus: false)
                .padding()
            Spacer()
            themeButtonView(theme: .animal, themeName: "animal")
                .padding()
            Spacer()
            themeButtonView(theme: .emotion, themeName: "emotion")
                .padding()
            Spacer()
            themeButtonView(theme: .fruit, themeName: "fruit")
                .padding()
            Spacer()
            CalculateButtonView(isPlus: true)
                .padding()
            Spacer()
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
