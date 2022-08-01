
import SwiftUI

struct MainGameBoardView: View {
    
    @EnvironmentObject var gameManager: MemorizeCardGameManger
    
    var body: some View {
        VStack {
            TitleView()
                .foregroundColor(gameManager.currentTheme.themeColor)
            CardListView()
            BottomButtonList()
        }
        .padding()
    }
}
