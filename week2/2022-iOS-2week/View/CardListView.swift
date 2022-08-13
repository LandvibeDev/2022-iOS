
import SwiftUI

struct CardListView: View {
    @EnvironmentObject private var manager: MemorizeGameManger
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(manager.gameModel.cards, id: \.id){ card in
                    CardView(card: card)
                        .aspectRatio(2 / 3, contentMode: .fit)
                }
            }
        }
    }
}
