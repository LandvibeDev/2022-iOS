
import SwiftUI

@main
struct MemorizeApp: App {
    
    let gameManager = MemorizeCardGameManger()
    
    var body: some Scene {
        WindowGroup {
            MainGameBoardView().environmentObject(gameManager)
        }
    }
}
