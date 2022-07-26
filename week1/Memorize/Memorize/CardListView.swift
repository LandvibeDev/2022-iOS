//
//  CardListView.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/07/26.
//

import SwiftUI

struct CardListView: View {
    @Binding var cardNum: Int
    func returnCardList() -> [String] {
        var cardList: [String] = []
        for (idx, emoji) in Theme.emotion.emojis.enumerated() {
            if idx < cardNum {
                cardList.append(emoji)
            }
        }
        return cardList
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(returnCardList(), id: \.self, content: { emoji in
                    CardView(content: emoji).aspectRatio(2 / 3, contentMode: .fit)
                })
            }
        }
    }

}

