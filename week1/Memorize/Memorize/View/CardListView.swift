
import SwiftUI

struct CardListView: View {
    
    @EnvironmentObject var gameManager: MemorizeCardGameManger
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(gameManager.emitCard(), id: \.hashValue){ element in
                    CardView(content: element)
                        .aspectRatio(2 / 3, contentMode: .fit)
                        .foregroundColor(gameManager.currentTheme.themeColor)
                }
            }
        }
    }
}
