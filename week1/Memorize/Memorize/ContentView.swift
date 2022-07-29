//
//  ContentView.swift
//  Memorize
//
//  Created by 임주민 on 2022/07/28.
//

import SwiftUI

struct ContentView: View {
  
  @State var countOfCards = 8
  @State var content = Emoji.vehicle
  
  var body: some View {
    ZStack {
      VStack {
        Text("Memorize!")
          .font(.largeTitle)
          .padding()
        
        ScrollView(showsIndicators: false) {
          LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 100))],  spacing: 10) {
            ForEach(0..<countOfCards, id: \.self) {idx in
              CardView(content: content[idx])
            }
          }
        }.padding()
        ButtonTabbar(countOfCards: $countOfCards, content: $content)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
