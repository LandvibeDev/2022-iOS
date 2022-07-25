//
//  ThemeButtonView.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

struct ThemeButtonView: View{
    var content: ImageAndText
    var body: some View {
        VStack{
            Image(systemName: content.Image)
                .font(.largeTitle)
            Text(content.Text)
                .lineLimit(1)
        }
    }
}

struct ThemeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeButtonView(content: ImageAndText("globe.asia.australia","Country"))
    }
}
