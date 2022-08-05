import SwiftUI

@main
struct MemorizeApp: App {
    var memorizeGame = MemorizeGameDealer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(memorizeGame)
        }
    }
}
