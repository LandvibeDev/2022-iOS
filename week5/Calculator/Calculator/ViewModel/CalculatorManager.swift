//
//  CalculatorManager.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import Foundation
import SwiftUI
class CalculatorManager: ObservableObject {
    
    // MARK: Property(ies)
    
    @Published private var calculator = Calculator()
    let maxNumberDisplayNormalNotation: Decimal = 999999999
    var displayValue: String {
        guard let DecimalTypeDisplayValue = Decimal(string: calculator.displayValue) else {
            return "오류"
        }
        if DecimalTypeDisplayValue > maxNumberDisplayNormalNotation {
            return DecimalTypeDisplayValue.exponentialNotation
        }
        return String(calculator.displayValue.insertComma)
    }
    var buttonLayout: [[Button]] {
        var buttonLayoutTemp: [[Button]] = [
            [.allClear, .toggle, .percent, .binaryOperator(.divide)],
            [.digit(.seven), .digit(.eight), .digit(.nine), .binaryOperator(.multiply)],
            [.digit(.four), .digit(.five), .digit(.six), .binaryOperator(.substarct)],
            [.digit(.one), .digit(.two), .digit(.three), .binaryOperator(.add)],
            [.digit(.zero), .dot, .equal]
        ]
        if !calculator.isAllClear {
            buttonLayoutTemp[buttonLayoutTemp.startIndex][buttonLayoutTemp.startIndex] = .clear
        }
        return buttonLayoutTemp
    }
    
    // MARK: Method(s)
    
    func buttonColor(_ button: Button) -> (Color, Color) {
        return (button.backgroundColor, button.foregorundColor)
    }
    
    func backWhenSwiped() {
        calculator.backWhenDragged()
    }
    
    func touchButton(_ button: Button) {
        switch button {
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

// MARK: Button

extension CalculatorManager {
    enum Button: Hashable {
        case digit(_ digit: Digit)
        case binaryOperator(_ binaryOperator: BinaryOperator)
        case equal
        case dot
        case percent
        case toggle
        case allClear
        case clear
        
        var appearance: String {
            switch self {
            case .digit(let digit):
                return digit.appearance
            case .binaryOperator(let binaryOperator):
                return binaryOperator.appearance
            case .equal:
                return "="
            case .dot:
                return "."
            case .percent:
                return "%"
            case .toggle:
                return "+/-"
            case .allClear:
                return "AC"
            case .clear:
                return "C"
            }
        }
        var backgroundColor: Color {
            switch self {
            case .digit, .dot:
                return Color(UIColor.darkGray)
            case .binaryOperator, .equal:
                return .orange
            default:
                return Color(UIColor.lightGray)
            }
        }
        var foregorundColor: Color {
            switch self {
            case .digit, .dot, .binaryOperator, .equal:
                return .white
            default:
                return .black
            }
        }
    }
    
    enum BinaryOperator {
        case add
        case substarct
        case divide
        case multiply
        
        var appearance: String {
            switch self {
            case .add:
                return "+"
            case .substarct:
                return "-"
            case .divide:
                return "/"
            case .multiply:
                return "*"
            }
        }
    }
    
    enum Digit: Int {
        case zero
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        
        var appearance: String {
            return String(describing: self.rawValue)
        }
    }
}
