//
//  SwiftUIView.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

struct SwiftUIView: View {
    
    @EnvironmentObject var viewModel: MemorizeGame
    
    var body: some View {
        Text("\(gameManager.currentCardNumber)")
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
