//
//  Button.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/18.
//

import SwiftUI

struct EachButton: View {
    @EnvironmentObject var calculatorManager: CalculatorManager
    let button: CalculatorManager.Button
    
    var body: some View {
        ZStack {
            Button(button.appearance) {
                calculatorManager.touchButton(button)
            } .buttonStyle(CalculateButtonStyle(buttonColor: calculatorManager.buttonColor(button), isZero: button.appearance == "0"))
        }
    }
}

//struct Button_Previews: PreviewProvider {
//    static var previews: some View {
//        Button()
//    }
//}
