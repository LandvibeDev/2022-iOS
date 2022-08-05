
import SwiftUI

struct PlusMinusButton: View {
   
    var mode: ModeForPlusMinusButton
    
    @EnvironmentObject var viewModel: MemorizeGame
    
    var body: some View {
        Button(action: {
            gameManager.cardCountChangeByMode(RawValue: mode.rawValue)
        }) {
            Image(systemName: mode.modeImage)
                .padding()
        }
    }
}
