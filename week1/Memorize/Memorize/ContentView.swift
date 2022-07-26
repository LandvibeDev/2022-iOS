//
//  ContentView.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/07/25.
//

import SwiftUI

struct ContentView: View {
    @State var cardNum: Int = Theme.emotion.emojis.count
    var body: some View {
        VStack {
            ScrollView {
                Text("Memorize!")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                CardListView(cardNum: $cardNum)
            }
            Spacer()
            HStack{
                addCard
                Spacer()
                subtractCard
            }
            .padding()
        }
        .foregroundColor(.red)
        .padding()
    }
    var addCard: some View {
        Button {
            if(Theme.emotion.emojis.count > cardNum)
            {
                cardNum += 1
            }
            
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    var subtractCard: some View {
        Button {
            if(cardNum > 0)
            {
                cardNum -= 1
            }

        } label: {
            Image(systemName: "minus.circle")
        }
    }


}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
