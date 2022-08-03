import SwiftUI

@main
struct MemorizeApp: App {
    var memorizeGame = MemorizeGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(memorizeGame)
        }
    }
}
