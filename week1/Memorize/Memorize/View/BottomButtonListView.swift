
import SwiftUI

struct BottomButtonList: View {
    
    @EnvironmentObject var gameManager: MemorizeCardGameManger
    
    var body: some View {
        HStack(alignment: .bottom) {
            PlusMinusButton(mode: .minus)
            ThemeButtonList()
            PlusMinusButton(mode: .plus)
        }
        .foregroundColor(gameManager.currentTheme.themeColor)
    }
}
