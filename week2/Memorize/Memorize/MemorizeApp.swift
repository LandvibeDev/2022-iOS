import SwiftUI

@main
struct MemorizeApp: App {
    private var memorizeGame = MemorizeGameDealer()
    
    var body: some Scene {
        WindowGroup {
            MemorizeGameView()
                .environmentObject(memorizeGame)
        }
    }
}
