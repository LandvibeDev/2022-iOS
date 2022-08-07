
import SwiftUI

@main
struct ChanggyoAssignment: App {
    let imojiMemorizeGameManager = MemorizeGameManger()
    
    var body: some Scene {
        WindowGroup {
            MainGameBoardView().environmentObject(imojiMemorizeGameManager)
        }
    }
}
