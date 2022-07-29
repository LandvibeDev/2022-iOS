import SwiftUI

struct CardListView: View {
    @EnvironmentObject var admin: Admin
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(admin.emojiList(), id: \.self, content: { emoji in
                    CardView(content: emoji).aspectRatio(2 / 3, contentMode: .fit)
                })
            }
        }
    }
}


