//
//  ContentView.swift
//  Memorize
//
//  Created by 임주민 on 2022/07/28.
//

import SwiftUI

struct ContentView: View {
  
  @State var countOfCards = 10
  
  var buttonTabView: some View {
    HStack(alignment: .center, spacing: 40) {
      ForEach(0..<5) { i in
        Button {
          switch i {
          case 0:
            countOfCards -= 1
          case 1:
            print("vehicle")
          case 2:
            print("face")
          case 3:
            print("sports")
          default:
            countOfCards += 1
          }
        } label: {
          VStack {
            switch i{
            case 0:
              Image(systemName: "minus.circle")
              
            case 1:
              Image(systemName: "car")
              Text("vehicle")
                .font(.system(size: 12))
              
            case 2:
              Image(systemName: "face.smiling")
              Text("face")
                .font(.system(size: 12))
              
            case 3:
              Image(systemName: "sportscourt")
              Text("sports")
                .font(.system(size: 12))
              
            default:
              Image(systemName: "plus.circle")
            }
          Spacer()
          }///VStack
        }///HStack
        .font(.system(size: 20))
        .foregroundColor(Color.red)
        .frame(height: UIScreen.main.bounds.height * 0.08)
      }
    }
  }
  
  var body: some View {
    ZStack {
      VStack {
        Text("Memorize!")
          .font(.largeTitle)
          .padding()
        
        ScrollView(showsIndicators: false) {
          LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 100))],  spacing: 10) {
            ForEach(0...countOfCards, id: \.self) {_ in
              CardView()
            }
          }
        }.padding()
        buttonTabView
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

