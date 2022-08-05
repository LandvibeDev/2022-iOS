
import SwiftUI

@main
struct changgyoAssignment: App {
    let environmentObject = MemorizeGameManger()
    
    var body: some Scene {
        WindowGroup {
            MainGameBoardView().environmentObject(environmentObject)
        }
    }
}
