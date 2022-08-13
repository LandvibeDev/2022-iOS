
import SwiftUI

struct BottomButtonList: View {
    @EnvironmentObject private var manager: MemorizeGameManger
    
    var body: some View {
        Button(action: {
            manager.tapStartNewGame()
        }) {
          Text("Next Game")
        }
    }
}
