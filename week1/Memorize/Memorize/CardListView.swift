import SwiftUI

struct CardListView: View {
    @EnvironmentObject var memorizeGame: MemorizeGame
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(memorizeGame.emojiList(), id: \.self, content: { emoji in
                    CardView(content: emoji).aspectRatio(2 / 3, contentMode: .fit)
                })
            }
        }
    }
}


