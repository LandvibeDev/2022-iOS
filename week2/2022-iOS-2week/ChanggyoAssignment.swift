
import SwiftUI

@main
struct ChanggyoAssignment: App {
    static let initGame = MemorizeGameManger.startNewGame()
    private let emojiMemorizeGameManager = MemorizeGameManger(initGame: initGame)
    
    var body: some Scene {
        WindowGroup {
            MainGameBoardView().environmentObject(emojiMemorizeGameManager)
        }
    }
}
