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
      minus
      changeThemeSport
      changeThemFace
      changeThemeSport
      plus
    }
    .font(.system(size: 20))
    .foregroundColor(Color.red)
    .frame(height: UIScreen.main.bounds.height * 0.08)
  }
  
  var minus: some View {
    Button {
      if countOfCards > 1 {
        countOfCards -= 1
      }
    } label: {
      Image(systemName: "minus.circle")
    }
  }
  
  var plus: some View {
    Button {
      if countOfCards < content.count {
        countOfCards += 1
      }
    } label: {
      Image(systemName: "plus.circle")
    }
  }
  
  var changeThemeSport: some View {
    Button {
      adjustCountOfCards(currentMaxCount: Emoji.sports.emojiList.count)
      content = Emoji.sports.shuffle
    } label: {
      VStack {
        Image(systemName: "sportscourt")
        Text("sports").font(.system(size: 12))
      }
    }
  }
  
  var changeThemFace: some View {
    Button {
      adjustCountOfCards(currentMaxCount: Emoji.faces.emojiList.count)
      content = Emoji.faces.shuffle
    } label: {
      VStack {
        Image(systemName: "face.smiling")
        Text("face").font(.system(size: 12))
      }
    }
  }
  
  var changeThemVehicle: some View {
    Button {
      adjustCountOfCards(currentMaxCount: Emoji.vehicles.emojiList.count)
      content = Emoji.vehicles.shuffle
    } label: {
      VStack {
        Image(systemName: "car")
        Text("vehicle").font(.system(size: 12))
      }
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
