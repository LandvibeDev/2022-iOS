//
//  HeaderView.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/05.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var viewModel: ThemeMemoryGame
    
    var body: some View {
        Text("Halloween")
            .foregroundColor(.red)
            .font(.largeTitle)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
