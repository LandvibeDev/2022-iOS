//
//  Calculator.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import Foundation
struct Calculator {
    var displayValue = "0"
    private var leftOperand: Decimal = 0
    private var newOperand: Decimal? = nil
    private var operation: BinaryOperator? = .add
        
    mutating func setDigit(_ newOperand: Digit) {
        if self.newOperand == nil {
            displayValue = String(describing: newOperand.rawValue)
            self.newOperand = Decimal(string: displayValue)
        } else {
            displayValue = displayValue.appending("\(newOperand.rawValue)")
            self.newOperand = Decimal(string: displayValue)
        }
    }
    
    mutating func setOperation(_ operation: BinaryOperator) {
        if self.operation != nil, self.newOperand != nil {
            leftOperand = calculate(operation: self.operation ?? .add, newOperand: newOperand ?? 0)
            displayValue = String(describing: leftOperand)
            newOperand = nil
        }
        self.operation = operation
    }
    
    mutating func equal() {
        guard let operation = operation, let newOperand = newOperand else {
            return
        }
        leftOperand = calculate(operation: operation, newOperand: newOperand)
        displayValue = String(describing: leftOperand)
        self.newOperand = nil
    }
    
    mutating func dot() {
        if displayValue.contains(".") { return }
        displayValue = displayValue.appending(".")
        newOperand = Decimal(string: displayValue)
    }
    
    mutating func percent() {
        if newOperand == nil {
            leftOperand = leftOperand * 0.01
            displayValue = String(describing: leftOperand)
        } else {
            newOperand = newOperand ?? 0 * 0.01
            displayValue = String(describing: newOperand)
        }
    }
    
    mutating func toggle() {
        if newOperand == nil {
            leftOperand = -leftOperand
            displayValue = String(describing: leftOperand)
        } else {
            newOperand = -newOperand!
            displayValue = String(describing: newOperand ?? 0)
        }
    }
    
    mutating func allClear() {
        leftOperand = 0
        displayValue = String(describing: leftOperand)
        operation = .add
        newOperand = nil
    }
    
    mutating func clear() {
        leftOperand = 0
        operation = .add
        newOperand = nil
    }
    
    mutating private func calculate(operation: BinaryOperator, newOperand: Decimal) -> Decimal {
        switch (operation) {
        case .add:
            return leftOperand + newOperand
        case .substarct:
            return leftOperand - newOperand
        case .divide:
            return leftOperand / newOperand
        case .multiply:
            return leftOperand * newOperand
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
            return "\(rawValue)"
        }
    }
}

