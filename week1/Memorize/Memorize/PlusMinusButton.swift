import SwiftUI

struct PlusMinusButton: View {
    @EnvironmentObject var admin: Admin
    var isPlus: plusOrMinus
    var body: some View {
        if isPlus == plusOrMinus.plus {
            Button {
                if admin.currentTheme.maxNumber > admin.cardNumber {
                    admin.cardNumber += 1
                }
            } label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: 20))
            }
            .padding()
            Spacer()
        }
        else {
            Button {
                if admin.cardNumber > 0
                {
                    admin.cardNumber -= 1
                }
            } label: {
                Image(systemName: "minus.circle")
                    .font(.system(size: 20))
            }
            .padding()
            Spacer()
        }
    }
}

