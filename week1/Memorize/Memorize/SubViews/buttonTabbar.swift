//
//  buttonTabbar.swift
//  Memorize
//
//  Created by 임주민 on 2022/07/29.
//

import SwiftUI

struct buttonTabbar: View {
  
  @Binding var countOfCards: Int
  @Binding var content: [String]
  @State var previousCount = 0
  
  var body: some View {
    HStack(alignment: .center, spacing: 40) {
      ForEach(0..<5) { i in
        Button {
          switch i {
          case 0:
            if countOfCards > 1 {
              countOfCards -= 1
            }
          case 1:
            adjustCountOfCards(previous: content.count, current: Emoji.vehicle.count)
            content = Emoji.vehicle.shuffled()
          case 2:
            adjustCountOfCards(previous: content.count, current: Emoji.face.count)
            content = Emoji.face.shuffled()
          case 3:
            adjustCountOfCards(previous: content.count, current: Emoji.sports.count)
            content = Emoji.sports.shuffled()
          default:
            if countOfCards < content.count {
              countOfCards += 1
            }
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
  
  func adjustCountOfCards(previous: Int, current: Int) {
    if previous > current {
      countOfCards = current
    }
  }
}

struct buttonTabbar_Previews: PreviewProvider {
  static var previews: some View {
    buttonTabbar(countOfCards: .constant(8), content: .constant([""]))
      .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1))
  }
}
