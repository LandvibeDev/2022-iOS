import SwiftUI

struct ButtonBar: View {
    @EnvironmentObject var admin: Admin
    var body: some View {
        HStack {
            PlusMinusButton(isPlus: .minus)
            ThemeButtonView(themeName: "animal")
            ThemeButtonView(themeName: "emotion")
            ThemeButtonView(themeName: "fruit")
            PlusMinusButton(isPlus: .plus)
        }
        .font(.largeTitle)
        .padding()
    }
}
struct ButtonBar_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBar()
    }
}
