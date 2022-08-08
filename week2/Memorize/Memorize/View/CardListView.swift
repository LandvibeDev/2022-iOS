import SwiftUI

struct CardListView: View {
    @EnvironmentObject var memorizeGameDealer: MemorizeGameDealer
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(memorizeGameDealer.cards, id: \.id) { card in
                    CardView(card: card).aspectRatio(2 / 3, contentMode: .fit)
                }
            }
        }
    }
}
