//
//  HeaderView.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/05.
//

import SwiftUI

struct TitleView: View {
    var title: String
    
    var body: some View {
        Text("\(title)")
            .font(.largeTitle)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Sports")
    }
}
