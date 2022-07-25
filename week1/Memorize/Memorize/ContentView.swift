//
//  ContentView.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/07/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🥺", "🥸", "🤩", "😜", "🧐", "😤", "😛", "🥳", "🥶", "😓", "🫡", "🫥"]
    var body: some View {
        VStack {
            ScrollView {
                Text("Memorize!")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65 ))]) {
                    ForEach(emojis, id: \.self, content: { emoji in
                        CardView(content: emoji).aspectRatio(2 / 3, contentMode: .fit)
                    })
                    
                }
            }
            Spacer()
            addCard
        }
        .foregroundColor(.red)
        .padding()
    }
    var addCard: some View {
        Button {
            // TODO: Add Card
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    @State var isFaceUp = true
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
        ContentView()
    }
}
