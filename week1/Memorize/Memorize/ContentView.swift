//
//  ContentView.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/07/18.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State var emojis = [
        ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚒"],
        ["🤣", "☺️", "😝", "😎", "😇", "🤪", "🤯", "🤩", "😡", "🥶"],
        ["🏀", "🥎", "🏐", "⚽️", "⛳️", "🥊", "🏑"]
    ]
    @State var emojiCount = 1
    @State var theme = 0
    var emojiTheme = ["Vehicle", "Face", "Sports"]
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .foregroundColor(.black)
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(0 ..< emojiCount, id: \.self, content: {
                        emoji in CardView(content: emojis[theme][emoji]).aspectRatio(2 / 3, contentMode: .fit)
                    })
                }
            }
            Spacer()
            HStack {
                subCard
                addCard
            }
        }
        .foregroundColor(.red)
        .padding()
    }
    
    var subCard: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var addCard: some View {
        Button {
            if emojiCount < emojis[theme].count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct themeButton: View {
    var themeTitle: String
    var themeImage: String

    var body: some View {
        VStack {
            Image(systemName: themeImage)
                .font(.largeTitle)
            Text(themeTitle)
                .font(.title)
        }
        .foregroundColor(.blue)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    let content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

