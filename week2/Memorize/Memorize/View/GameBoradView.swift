//
//  GameBoardView.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/02.
//

import SwiftUI

struct GameBoardView: View {
    
    @ObservedObject var viewModel: ThemeMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                    .frame(width: 90)
                HeaderView()
                    .frame(alignment: .center)
                PointView()
                    .frame(width: 90,alignment: .center)
            }
            .frame(height: 10)
            .padding(EdgeInsets(top:20, leading: 0, bottom: 10, trailing: 0))
            if viewModel.memoryGame.gameOver() {
                GameOverView()
            } else {
                CardListView(viewModel: viewModel)
            }
            FooterView()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let viewModel = ThemeMemoryGame()
            GameBoardView(viewModel: viewModel)
        }
    }
}
