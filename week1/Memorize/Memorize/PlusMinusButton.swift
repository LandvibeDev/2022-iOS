import SwiftUI

struct PlusMinusButton: View {
    @EnvironmentObject var memorizeGame: MemorizeGame
    var isPlus: Calculate
    var body: some View {
        if isPlus == Calculate.plus {
            Button {
                if memorizeGame.currentTheme.maxNumber > memorizeGame.cardNumber {
                    memorizeGame.cardNumber += 1
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
                if memorizeGame.cardNumber > 0
                {
                    memorizeGame.cardNumber -= 1
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

