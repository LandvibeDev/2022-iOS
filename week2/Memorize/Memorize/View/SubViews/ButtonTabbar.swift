//
//  ButtonTabbar.swift
//  Memorize
//
//  Created by 임주민 on 2022/08/07.
//

import SwiftUI

struct ButtonTabbar: View {
  
  @ObservedObject var memoryGameManager: EmojiMemoryGame
  
  var body: some View {
    Button {
      memoryGameManager.newGame()
    } label: {
      Text("New Game")
        .font(.body)
    }
  }
}

struct ButtonTabbar_Previews: PreviewProvider {
  
  static var previews: some View {
    let memoryGameManager = EmojiMemoryGame()
    ButtonTabbar(memoryGameManager: memoryGameManager)
  }
}
