import SwiftUI

struct PlusMinusButton: View {
    @EnvironmentObject var toBeObserved: ToBeObserved
    var isPlus: plusOrMinus
    var body: some View {
        if isPlus == plusOrMinus.plus {
            Button {
                if toBeObserved.currentTheme.maxNumber > toBeObserved.cardNumber {
                    toBeObserved.cardNumber += 1
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
                if toBeObserved.cardNumber > 0
                {
                    toBeObserved.cardNumber -= 1
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

