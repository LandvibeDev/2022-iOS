import SwiftUI

struct ThemeNameView: View {
    let currentThemeName: String
    
    var body: some View {
        Text(currentThemeName).font(.largeTitle)
    }
}

struct ThemeNameView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeNameView(currentThemeName: "")
    }
}
