//
//  Button.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/18.
//

import SwiftUI

struct EachButton: View {
    @EnvironmentObject var calculatorManager: CalculatorManager
    var button: Calculator.Button
    
    var body: some View {
        ZStack {
            Button(button.appearance) {
                calculatorManager.touchButton(button)
            } .buttonStyle(CalculateButtonStyle(backgroundColor: calculatorManager.buttonColor(color: button.backgroundColor), foregroundColor: calculatorManager.buttonColor(color: button.foregorundColor), isZero: button.appearance == "0"))
        }
    }
}

//struct Button_Previews: PreviewProvider {
//    static var previews: some View {
//        Button()
//    }
//}
