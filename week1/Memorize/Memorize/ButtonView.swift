import SwiftUI

struct ButtonView: View {
    @EnvironmentObject var toBeObserved: ToBeObserved
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
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
