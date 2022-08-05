
import SwiftUI

class MemorizeGameManger: ObservableObject{
    @Published var themeModel: Theme = Theme()
    @Published var gameManage: ImojiGame = ImojiGame()
    
    func tappedNewGame() {
        themeModel.changeTheme()
        gameManage.changeGameByTheme(cardImojis: themeModel.content, displayCardCount: themeModel.displayCardCount)
    }
    
    func tappedCard(_ card: Int) {
        gameManage.toggleCard(card)
    }
}
