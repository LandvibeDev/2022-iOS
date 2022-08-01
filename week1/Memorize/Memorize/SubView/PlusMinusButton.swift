
import SwiftUI

struct PlusMinusButton: View {
   
    var mode: ModeForPlusMinusButton
    
    @EnvironmentObject var gameManager: MemorizeCardGameManger
    
    var body: some View {
        Button(action: {
            gameManager.cardCountChangeByMode(RawValue: mode.rawValue)
        }) {
            Image(systemName: mode.modeImage)
                .padding()
        }
    }
}
