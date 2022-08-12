//
//  NewGameView.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/05.
//

import SwiftUI

struct NewGameView: View {
    @ObservedObject var viewModel: ThemeMemoryGame
    
    var body: some View {
        Button {
            viewModel.memoryGame = ThemeMemoryGame.createMemoryGame()
        } label: {
            Text("New Game")
        }
    }
}

struct FooterView_Previeaws: PreviewProvider {
    static var previews: some View {
        let viewModel = ThemeMemoryGame()
        NewGameView(viewModel: viewModel)
    }
}
