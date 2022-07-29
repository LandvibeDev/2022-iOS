import Foundation
import SwiftUI

struct ThemeButtonView: View {
    @EnvironmentObject var toBeObserved: ToBeObserved
    var themeName: String
    init(themeName: String) {
        self.themeName = themeName
    }
    var body: some View {
        Button(action: {
            toBeObserved.changeTheme(afterTheme: Theme(rawValue: themeName) ?? .emotion)
        }) {
            VStack {
                Theme(rawValue: themeName)?.symbol
                Text("\(themeName)")
                    .fixedSize(horizontal: true, vertical: true)
                    .font(.system(size: 10))
            }
            .font(.system(size: 20))
        }
        .padding()
        Spacer()
    }
}
