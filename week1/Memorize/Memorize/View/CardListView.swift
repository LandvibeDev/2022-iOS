//
//  CardListView.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

struct CardListView: View {
    
    @EnvironmentObject var gameManager: MemorizeCardGameManger
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(gameManager.emitCard(), id: \.hashValue, content: { element in
                    CardView(isFaceUp: true, content: element)
                        .aspectRatio(2 / 3, contentMode: .fit)
                })
            }
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView()
    }
}
