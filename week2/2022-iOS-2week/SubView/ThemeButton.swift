
import SwiftUI

struct ThemeButton: View {
    
    var content: GameManageModel.Card
    
    @EnvironmentObject var viewModel: MemorizeGame
    
    var body: some View {
        Button(action: {
            viewModel.tappedCard(content)
        }) {
            VStack {
                Text(content.imoji)
                    .font(.largeTitle)
            }
        }
    }
}
