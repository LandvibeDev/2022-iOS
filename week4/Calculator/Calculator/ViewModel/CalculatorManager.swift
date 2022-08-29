//
//  CalculatorManager.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import SwiftUI

class CalculatorManager: ObservableObject {
    
    // MARK: Alia(es)
    
    typealias Button = Calculator.Button
    
    // MARK: Property(ies)
    
    @Published private var calculator = Calculator()
    let maxNumberDisplayNormalNotation: Decimal = 999999999
    var displayValue: String {
        return calculator.displayValue
    }
    var pad: [[Button]] {
        var buttonLayout: [[Button]] = [
            [.allClear, .toggle, .percent, .binaryOperator(.divide)],
            [.digit(.seven), .digit(.eight), .digit(.nine), .binaryOperator(.multiply)],
            [.digit(.four), .digit(.five), .digit(.six), .binaryOperator(.substarct)],
            [.digit(.one), .digit(.two), .digit(.three), .binaryOperator(.add)],
            [.digit(.zero), .dot, .equal]
        ]
        if !calculator.isAllClear {
            buttonLayout[buttonLayout.startIndex][buttonLayout[buttonLayout.startIndex].startIndex] = .clear
        }
        return buttonLayout
    }
    
    // MARK: Method(s)
    
    func buttonColor(_ button: Button) -> (Color, Color) {
        switch button {
        case .digit, .dot:
            return (Color(UIColor.darkGray), .white)
        case .binaryOperator, .equal:
            return (.orange, .white)
        default:
            return (Color(UIColor.lightGray), .black)
        }
    }
    
    func undoWhenSwiped() {
        calculator.undoWhenDragged()
    }
    
    func touchButton(_ button: Button) {
        switch button {
        case .digit(let digit):
            calculator.setDigit(digit)
        case .binaryOperator(let binaryOperator):
            calculator.setOperator(binaryOperator)
        case .equal:
            calculator.equal()
        case .dot:
            calculator.dot()
        case .percent:
            calculator.percent()
        case .toggle:
            calculator.toggleDisplayNumber()
        case .allClear:
            calculator.allClear()
        case .clear:
            calculator.clear()
        }
    }
}

