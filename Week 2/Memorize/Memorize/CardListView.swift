import SwiftUI

struct CardListView: View {
    @EnvironmentObject var memorizeGame: MemorizeGame
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(memorizeGame.cards, id: \.self.id) { card in
                    CardView(card: card).aspectRatio(2 / 3, contentMode: .fit)
                }
            }
        }
    }
}


