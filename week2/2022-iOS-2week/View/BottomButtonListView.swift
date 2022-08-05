
import SwiftUI

struct BottomButtonList: View {
    @EnvironmentObject var gameManager: MemorizeGameManger
    
    var body: some View {
        Button(action: {
            gameManager.tappedNewGame()
        }){
          Text("Next Game")
        }
    }
}
