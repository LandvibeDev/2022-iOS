import SwiftUI

@main
struct MemorizeApp: App {
    private var memorizeGameDealer = MemorizeGameDealer()
    
    var body: some Scene {
        WindowGroup {
            MemorizeGameView()
                .environmentObject(memorizeGameDealer)
        }
    }
}
