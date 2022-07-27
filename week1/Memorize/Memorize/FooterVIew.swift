//
//  FooterVIew.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/07/26.
//

import SwiftUI

struct FooterVIew: View {

    @ObservedObject var toBeObserved: ToBeObserved
    var body: some View {
        HStack{
            calculateButtonView(isPlus: false, toBeOberved: toBeObserved)
                .padding()
            themeButtonView(theme: .animal, themeName: "animal", toBeOberved: toBeObserved)
                .padding()
            themeButtonView(theme: .emotion, themeName: "emotion", toBeOberved: toBeObserved)
                .padding()
            themeButtonView(theme: .fruit, themeName: "fruit", toBeOberved: toBeObserved)
                .padding()
            calculateButtonView(isPlus: true, toBeOberved: toBeObserved)
                .padding()
        }
        .font(.largeTitle)
        .padding()
        
    }
}

struct FooterVIew_Previews: PreviewProvider {
    static var previews: some View {
        FooterVIew(toBeObserved: ToBeObserved())
    }
}
