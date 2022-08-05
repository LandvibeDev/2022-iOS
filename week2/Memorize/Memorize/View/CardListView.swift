//
//  CardListView.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/05.
//

import SwiftUI

struct CardListView: View {
    @ObservedObject var viewModel: ThemeMemoryGame
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in CardView(card: card)
                        .aspectRatio(2 / 3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            .foregroundColor(.red)
            .padding()
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ThemeMemoryGame()
        CardListView(viewModel: viewModel)
    }
}
