
import SwiftUI

struct ThemeButton: View {
    
    var content: ThemeInfo
    
    @EnvironmentObject var gameManager: MemorizeCardGameManger
    
    var body: some View {
        Button(action: {
            gameManager.currentTheme = content
        }) {
            VStack {
                Image(systemName: content.themeRepresentativeImageName)
                Text(content.themeName)
                    .font(.subheadline)
                    .lineLimit(1)
            }
        }
    }
}
