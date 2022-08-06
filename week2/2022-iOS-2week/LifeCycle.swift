
import SwiftUI

@main
struct ChanggyoAssignment: App {
    let environmentObject = MemorizeGameManger()
    
    var body: some Scene {
        WindowGroup {
            MainGameBoardView().environmentObject(environmentObject)
        }
    }
}
