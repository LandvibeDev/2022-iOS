
import SwiftUI

struct CardListView: View {
    @EnvironmentObject var gameManager: MemorizeGameManger
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(gameManager.gameManage.cards, id: \.hashValue){ element in
                    CardView(content: element)
                        .aspectRatio(2 / 3, contentMode: .fit)
                        .foregroundColor(gameManager.themeModel.current.color)
                }
            }
        }
    }
}
