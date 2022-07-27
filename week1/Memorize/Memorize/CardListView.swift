//
//  CardListView.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/07/26.
//

import SwiftUI

struct CardListView: View {
    @ObservedObject var toBeObserved: ToBeObserved

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(toBeObserved.returnCardList(), id: \.self, content: { emoji in
                    CardView(content: emoji).aspectRatio(2 / 3, contentMode: .fit)
                })
                
            }
        }
    }
}


