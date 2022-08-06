import SwiftUI

struct ThemeNameView: View {
    @EnvironmentObject var memorizeGame: MemorizeGameDealer
    
    var body: some View {
        Text("\(memorizeGame.currentTheme.rawValue)")
            .font(.largeTitle)
            .foregroundColor(memorizeGame.themeColor)
    }
}

struct ThemeNameView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeNameView()
    }
}
