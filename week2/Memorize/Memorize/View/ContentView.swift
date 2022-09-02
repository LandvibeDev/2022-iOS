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
      if memoryGameManager.isGameDone {
        WellDoneView(point: memoryGameManager.point)
      } else {
        TopInfoView(title: memoryGameManager.title, point: memoryGameManager.point)
        CardSetView(memoryGameManager: memoryGameManager)
      }
      ButtonTabbar(memoryGameManager: memoryGameManager)
    }
    .font(.largeTitle)
    .foregroundColor(memoryGameManager.themecolor)
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  
  static var previews: some View {
    let memoryGameManager = EmojiMemoryGame()
    ContentView(memoryGameManager: memoryGameManager)
  }
}
