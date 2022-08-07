//
//  ContentView.swift
//  Memorize
//
//  Created by 임주민 on 2022/07/28.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var viewModel: EmojiMemoryGame
  
  var body: some View {
    VStack {
      switch viewModel.state {
      case .playing:
        Text("Memorize!")
        ScrollView(showsIndicators: false) {
          LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 100))],  spacing: 10) {
            ForEach(viewModel.cards) { card in
              CardView(card: card)
                .onTapGesture{
                  viewModel.choose(card)
                }
            }
          }
        }
      case .done:
        Text("Well Done!")
        Text("You got Points!!")
      }
    }
    .font(.largeTitle)
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  
  static var previews: some View {
    ContentView(viewModel: EmojiMemoryGame())
  }
}
