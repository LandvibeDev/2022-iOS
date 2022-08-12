//
//  HeaderView.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/05.
//

import SwiftUI

struct HeaderView: View {
    var title: String
    
    var body: some View {
        Text("\(title)")
            .font(.largeTitle)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Sports")
    }
}
