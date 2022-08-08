//
//  ContentView.swift
//  Memorize
//
//  Created by 임주민 on 2022/07/28.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var memoryGameManager: EmojiMemoryGame
  
  var body: some View {
    VStack {
      switch memoryGameManager.state {
      case .playing:
        Text("Memorize!")
        Text("point : \(memoryGameManager.point)").font(.body)
        ScrollView(showsIndicators: false) {
          LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 100))],  spacing: 10) {
            ForEach(memoryGameManager.cards) { card in
              CardView(card: card)
                .onTapGesture{
                  memoryGameManager.choose(card)
                  print(card)
                }
            }
          }
        }
      case .done:
        Text("Well Done!")
        Text("You got \(memoryGameManager.point) Points!!")
      }
      ButtonTabbar(memoryGameManager: EmojiMemoryGame())
        .padding()
    }
    .font(.largeTitle)
    .accentColor(.pink)
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  
  static var previews: some View {
    ContentView(memoryGameManager: EmojiMemoryGame())
  }
}
