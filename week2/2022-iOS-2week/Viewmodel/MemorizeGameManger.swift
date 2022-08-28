
import SwiftUI

class MemorizeGameManger: ObservableObject {
    @Published private(set) var themeModel: Theme
    @Published private(set) var gameModel: EmojiGame<String>
    @Published private(set) var finishThisRound = false
    
    init(initGame: (themeModel: Theme, gameModel: EmojiGame<String>)) {
        self.themeModel = initGame.themeModel
        self.gameModel = initGame.gameModel
    }
    
    func tapStartNewGame() {
        typealias MemorizeGameModelTuple = (themeModel: Theme, gameModel: EmojiGame<String>)
        
        let startNewGameResult: MemorizeGameModelTuple = MemorizeGameManger.startNewGame()
        
        themeModel = startNewGameResult.themeModel
        gameModel = startNewGameResult.gameModel
        finishThisRound = false
    }
    
    func tappedCard(cardId: Int) {
        gameModel.changeStateCard(cardId: cardId)
        if gameModel.leftCardSetCount == 0 {
            finishThisRound = true
        }
    }
}

extension MemorizeGameManger {
    static func startNewGame() -> (Theme, EmojiGame<String>) {
        let theme = Theme()
        let emojiGame = EmojiGame(cardEmojis: theme.content, displayCardCount: theme.displayCardCount)
        return (theme, emojiGame)
    }
}
