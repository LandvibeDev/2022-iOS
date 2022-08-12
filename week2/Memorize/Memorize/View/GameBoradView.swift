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
            if viewModel.gameOver {
                GameOverView(point: viewModel.point)
            } else {
                HStack {
                    Spacer()
                        .frame(width: 90)
                    TitleView(title: viewModel.title)
                        .frame(alignment: .center)
                    PointView(point: viewModel.point)
                        .frame(width: 90,alignment: .center)
                }
                .frame(height: 10)
                .padding(EdgeInsets(top:20, leading: 0, bottom: 10, trailing: 0))
                CardListView(viewModel: viewModel)
            }
            NewGameView(viewModel: viewModel)
        }
        .foregroundColor(viewModel.color)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let viewModel = ThemeMemoryGame()
            GameBoardView(viewModel: viewModel)
        }
    }
}
