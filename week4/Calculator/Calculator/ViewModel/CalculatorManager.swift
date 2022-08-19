//
//  CalculatorManager.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import Foundation
import SwiftUI
class CalculatorManager: ObservableObject {
    @Published private var calculator = Calculator()
    var displayValue: String {
        return calculator.displayValue
    }
    var buttonLayout: [[Calculator.Button]] {
        return calculator.buttonLayout
    }
    
    func buttonColor(color: String) -> Color {
        switch(color) {
        case "orange":
            return Color.orange
        case "white":
            return Color.white
        case "black":
            return Color.black
        case "gray":
            return Color.gray
        case "secondary":
            return Color.secondary
        default:
            return Color.black
        }
    }
  
    func touchButton(_ button: Calculator.Button) {
        switch (button) {
        case .digit(let digit):
            calculator.setDigit(digit)
        case .binaryOperator(let binaryOperator):
            calculator.setOperation(binaryOperator)
        case .equal:
            calculator.equal()
        case .dot:
            calculator.dot()
        case .percent:
            calculator.percent()
        case .toggle:
            calculator.toggle()
        case .allClear:
            calculator.allClear()
        case .clear:
            calculator.clear()
        }
    }
}
