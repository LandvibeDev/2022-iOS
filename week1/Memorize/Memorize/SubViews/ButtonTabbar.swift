//
//  buttonTabbar.swift
//  Memorize
//
//  Created by 임주민 on 2022/07/29.
//

import SwiftUI

struct ButtonTabbar: View {
  @Binding var countOfCards: Int
  @Binding var content: [String]
  @State var previousCount = 0
  
  var body: some View {
    HStack(alignment: .center, spacing: 40) {
      ForEach(0..<5) { index in
        switch index {
        case 0:
          Button {
            if countOfCards > 1 {
              countOfCards -= 1
            }
          } label: {
            Image(systemName: "minus.circle")
          }
        case 1:
          Button {
            adjustCountOfCards(currentMaxCount: Emoji.vehicles.count)
            content = Emoji.vehicles.shuffled()
          } label: {
            VStack {
              Image(systemName: "car")
              Text("vehicle")
                .font(.system(size: 12))
            }
          }
        case 2:
          Button {
            adjustCountOfCards(currentMaxCount: Emoji.faces.count)
            content = Emoji.faces.shuffled()
          } label: {
            VStack {
              Image(systemName: "face.smiling")
              Text("face")
                .font(.system(size: 12))
            }
          }
        case 3:
          Button {
            adjustCountOfCards(currentMaxCount: Emoji.sports.count)
            content = Emoji.sports.shuffled()
          } label: {
            VStack {
              Image(systemName: "sportscourt")
              Text("sports")
                .font(.system(size: 12))
            }
          }
        case 4:
          Button {
            if countOfCards < content.count {
              countOfCards += 1
            }
          } label: {
            Image(systemName: "plus.circle")
          }
        default:
          Button {
          } label: {
          }
        }
      }
      .font(.system(size: 20))
      .foregroundColor(Color.red)
      .frame(height: UIScreen.main.bounds.height * 0.08)
    }
  }
  
  private func adjustCountOfCards(currentMaxCount: Int) {
    if countOfCards > currentMaxCount {
      countOfCards = currentMaxCount
    }
  }
}

struct ButtonTabbar_Previews: PreviewProvider {
  static var previews: some View {
    ButtonTabbar(countOfCards: .constant(8), content: .constant([""]))
      .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1))
  }
}
