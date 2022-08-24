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
    var displayValue: String {
        /*
         -------------------- README 5번 --------------------
         */
        //        if calculator.displayValue.count > 9 {
        //            return Double(calculator.displayValue.insertComma)!.exponentialNotation
        //        } else {
        //            return calculator.displayValue.insertComma
        //        }
        //        return calculator.displayValue.insertComma
        return Double(calculator.displayValue.insertComma)!.exponentialNotation
        //------------------------------------------------------------
    }
    var buttonLayout: [[Button]] {
        /*
         -------------------- README 6번 --------------------
         */
        var buttonLayoutTemp: [[Button]] = [
            [.allClear, .toggle, .percent, .binaryOperator(.divide)],
            [.digit(.seven), .digit(.eight), .digit(.nine), .binaryOperator(.multiply)],
            [.digit(.four), .digit(.five), .digit(.six), .binaryOperator(.substarct)],
            [.digit(.one), .digit(.two), .digit(.three), .binaryOperator(.add)],
            [.digit(.zero), .dot, .equal]
        ]
        if !calculator.isAllClear {
            buttonLayoutTemp[0][0] = .clear
        }
        return buttonLayoutTemp
        //------------------------------------------------------------
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
            /*
             -------------------- README 4, 5번 --------------------
             */
            //            print(calculator.displayValue.count)
            //            if calculator.displayValue.count >= 9 {
            //                return
            //            }
            //------------------------------------------------------------
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

// MARK: insertComma

/*
 -------------------- README 3번 --------------------
 */

extension String {
    var insertComma: String {
        let numberFormatter = NumberFormatter();
        numberFormatter.numberStyle = .decimal
        if let _ = self.range(of: ".") {
            let numberArray = self.components(separatedBy: ".")
            if numberArray.count == 1 {
                var numberString = numberArray[0]
                if numberString.isEmpty {
                    numberString = "0"
                }
                guard let doubleValue = Double(numberString) else {
                    return self
                }
                return numberFormatter.string(from: NSNumber(value: doubleValue)) ?? self
            } else if numberArray.count == 2 {
                var numberString = numberArray[0]
                if numberString.isEmpty {
                    numberString = "0"
                }
                guard let doubleValue = Double(numberString) else {
                    return self
                }
                return (numberFormatter.string(from: NSNumber(value: doubleValue)) ?? numberString) + ".\(numberArray[1])"
            }
        } else {
            guard let doubleValue = Double(self) else {
                return self
            }
            return numberFormatter.string(from: NSNumber(value: doubleValue)) ?? self
        }
        return self
    }
}
//------------------------------------------------------------

/*
    -------------------- README 5번 --------------------
 */

extension Formatter {
    static let scientific: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.positiveFormat = "0.###E+0"
        formatter.exponentSymbol = "e"
        return formatter
    }()
}

extension Numeric {
    var exponentialNotation: String {
        return Formatter.scientific.string(for: self) ?? ""
    }
}
//------------------------------------------------------------

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
