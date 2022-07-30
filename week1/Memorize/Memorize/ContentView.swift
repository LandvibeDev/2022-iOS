//
//  ContentView.swift
//  SummerCoding
//
//  Created by Kyungsoo Lee on 2022/07/18.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State var emojiCount = 1
    @State var theme = 2
    @State var refreshView: Bool = true
    @State var contentList: [String] = Emoji.emojis[0]
    var emojiTheme = [
        ["Vehicle", "car"],
        ["Face", "face.smiling"],
        ["Sports", "sportscourt"]
    ]
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .foregroundColor(.black)
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(0 ..< emojiCount, id: \.self, content: {
                        emoji in CardView(content: contentList[emoji]).aspectRatio(2 / 3, contentMode: .fit)
                    })
                }
            }
            Spacer()
            HStack {
                Spacer()
                subCard
                Spacer()
                ForEach(0 ..< 3) {
                    index in themeButton(themeTitle: emojiTheme[index][0], themeImage: emojiTheme[index][1])
                        .onTapGesture {
                            let countBeforeChange = emojiCount;
                            theme = index
                            if Emoji.emojis[theme].count < countBeforeChange {
                                emojiCount = Emoji.emojis[theme].count
                            }
                            contentList = Emoji.emojis[theme].shuffled()
                        }
                    Spacer()
                }
                addCard
                Spacer()
            }
        }
        .foregroundColor(.red)
        .padding()
    }
    
    var subCard: some View {
        Button {
            if emojiCount > 0 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var addCard: some View {
        Button {
            if emojiCount < Emoji.emojis[theme].count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct Emoji {
    static var emojis = [
        ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚒"],
        ["🤣", "☺️", "😝", "😎", "😇", "🤪", "🤯", "🤩", "😡", "🥶"],
        ["🏀", "🥎", "🏐", "⚽️", "⛳️", "🥊", "🏑"]
    ]
    enum emojiType {
        case Vehicle
        case Face
        case Sports
    }
}

struct themeButton: View {
    var themeTitle: String
    var themeImage: String
    
    var body: some View {
//  Button으로 다시 구현해보기
        VStack {
            Image(systemName: themeImage)
            Text(themeTitle)
        }
        .foregroundColor(.red)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true

    let content: String
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUP{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUP.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
