//
//  ContentView.swift
//  Memorize
//
//  Created by 임주민 on 2022/07/28.
//

import SwiftUI

struct ContentView: View {
  @State var countOfCards = 8
  @State var contents = Emoji.vehicles
  
  var body: some View {
    VStack {
      Text("Memorize!")
        .font(.largeTitle)
        .padding()
      ScrollView(showsIndicators: false) {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 100))],  spacing: 10) {
          ForEach(0..<countOfCards, id: \.self) { index in
            CardView(content: contents[index])
          }
        }
      }.padding()
      ButtonTabbar(countOfCards: $countOfCards, content: $contents)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
