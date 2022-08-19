//
//  Calculator.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import Foundation
struct Calculator {
    private(set) var displayValue = "0"
    private var leftOperand: Decimal? = 0
    private var newValue: Decimal? = nil
    private var operation: BinaryOperator? = .add
        
    mutating func setDigit(_ newOperand: Digit) {
        if self.newValue == nil || displayValue == "오류" {
            displayValue = String(describing: newOperand.rawValue)
            self.newValue = Decimal(string: displayValue)
        } else {
            displayValue = displayValue.appending(String(describing: newOperand.rawValue))
            self.newValue = Decimal(string: displayValue)
        }
    }

    mutating func setOperation(_ operation: BinaryOperator) {
        if self.operation != nil, self.newValue != nil {
            leftOperand = calculate(operation: self.operation ?? .add, newValue: newValue ?? 0)
            if leftOperand == nil {
                displayValue = "오류"
                return
            }
            displayValue = String(describing: leftOperand!)
            newValue = nil
        }
        self.operation = operation
    }
    
    mutating func equal() {
        guard let operation = operation, let newOperand = newValue else { return }
        if operation == BinaryOperator.divide, newValue == 0 {
            displayValue = "오류"
            newValue = nil
            return
        }
        leftOperand = calculate(operation: operation, newValue: newOperand)
        displayValue = String(describing: leftOperand!)
        self.newValue = nil
    }
    
    mutating func dot() {
        if displayValue.contains(".") { return }
        displayValue = displayValue.appending(".")
        newValue = Decimal(string: displayValue)
    }
    
    mutating func percent() {
        guard let leftOperand = leftOperand else {
            return
        }
        if newValue == nil {
            self.leftOperand = leftOperand * 0.01
            displayValue = String(describing: leftOperand)
        } else {
            newValue = newValue ?? 0 * 0.01
            displayValue = String(describing: newValue)
        }
    }
    
    mutating func toggle() {
        guard let leftOperand = leftOperand else {
            return
        }
        if newValue == nil {
            self.leftOperand = -leftOperand
            displayValue = String(describing: leftOperand)
        } else {
            newValue = -newValue!
            displayValue = String(describing: newValue ?? 0)
        }
    }
    
    mutating func allClear() {
        leftOperand = 0
        displayValue = "0"
        operation = .add
        newValue = nil
    }
    
    mutating func clear() {
        displayValue = "0"
        newValue = nil
    }
    
    private func calculate(operation: BinaryOperator, newValue: Decimal) -> Decimal? {
        guard let leftOperand = leftOperand else {
            return nil
        }
        switch (operation) {
        case .add:
            return leftOperand + newValue
        case .substarct:
            return leftOperand - newValue
        case .divide:
            if newValue == 0 {
               return nil
            }
            return leftOperand / newValue
        case .multiply:
            return leftOperand * newValue
        }
    }
}

extension Calculator {
    var buttonLayout: [[Button]] {
        [
            [.allClear, .toggle, .percent, .binaryOperator(.divide)],
            [.digit(.seven), .digit(.eight), .digit(.nine), .binaryOperator(.multiply)],
            [.digit(.four), .digit(.five), .digit(.six), .binaryOperator(.substarct)],
            [.digit(.one), .digit(.two), .digit(.three), .binaryOperator(.add)],
            [.digit(.zero), .dot, .equal]
        ]
    }
    
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
            switch (self) {
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
        var backgroundColor: String {
            switch (self) {
            case .digit, .dot:
                return "secondary"
            case .binaryOperator, .equal:
                return "orange"
            default:
                return "gray"
            }
        }
        var foregorundColor: String {
            switch (self) {
            case .digit, .dot, .binaryOperator, .equal:
                return "white"
            default:
                return "black"
            }
        }
    }
    
    enum BinaryOperator {
        case add
        case substarct
        case divide
        case multiply
        
        var appearance: String {
            switch (self) {
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
