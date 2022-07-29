import SwiftUI

struct CardListView: View {
    @EnvironmentObject var toBeObserved: ToBeObserved
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(toBeObserved.emojiList(), id: \.self, content: { emoji in
                    CardView(content: emoji).aspectRatio(2 / 3, contentMode: .fit)
                })
            }
        }
    }
}


