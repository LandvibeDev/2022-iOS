//
//  Calculator.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import Foundation
struct Calculator {
    private(set) var displayValue = "0"           //Screen에 보여주기 위함
    private var calculationResult: Decimal? = 0  //연산 결과를 가지고 있는 변수
    private var newValue: Decimal? = nil         // 새 입력 변수
    private var operation: BinaryOperator? = .add // 현재 연산
    private var isAllClear = true //AC or C
    var isCalculationResultIsNil: Bool { //divide by zero excetion
        calculationResult == nil
    }
    
    mutating func setDigit(_ newValue: Digit) {
        if self.newValue == nil || isCalculationResultIsNil { //새로 입력하는 경우 ex) 1
            displayValue = String(describing: newValue.rawValue)
            self.newValue = Decimal(string: displayValue)
            isAllClear = false
        } else { // 이어붙이는 경우 ex) 123
            displayValue = displayValue.appending(String(describing: newValue.rawValue))
            self.newValue = Decimal(string: displayValue)
        }
    }
    
    mutating func setOperation(_ newOperation: BinaryOperator) {
        guard let operation = operation, let newValue = newValue else {
            self.operation = newOperation
            return
        }
        calculationResult = calculate(operation: operation, newValue: newValue)
        guard let calculationResult = calculationResult else {
            displayValue = "오류"
            return
        }
        displayValue = String(describing: calculationResult)
        self.newValue = nil
        self.operation = newOperation
    }
    
    mutating func equal() {
        guard let operation = operation, let newValue = newValue else { return }
        if operation == BinaryOperator.divide, newValue == 0 {
            calculationResult = nil
            displayValue = "오류"
            self.newValue = nil
            return
        }
        calculationResult = calculate(operation: operation, newValue: newValue)
        guard let calculationResult = calculationResult else {
            displayValue = "오류"
            self.newValue = nil
            return
        }
        displayValue = String(describing: calculationResult)
    }
    
    mutating func dot() {
        if displayValue.contains(".") || isCalculationResultIsNil { return }
        displayValue = displayValue.appending(".")
        isAllClear = false
        newValue = Decimal(string: displayValue)
    }
    
    mutating func percent() {
        guard let calculationResult = calculationResult else {
            return
        }
        guard let newValue = newValue else {
            displayValue = String(describing: calculationResult * 0.01)
            self.calculationResult = Decimal(string: displayValue)
            return
        }
        displayValue = String(describing: newValue * 0.01)
        self.newValue = Decimal(string: displayValue)
    }
    
    mutating func toggle() {
        guard let calculationResult = calculationResult else {
            return
        }
        guard let newValue = newValue else {
            displayValue = String(describing: -calculationResult)
            self.calculationResult = Decimal(string: displayValue)
            return
        }
        displayValue = String(describing: newValue)
        self.newValue = Decimal(string: displayValue)
    }
    
    mutating func allClear() {
        calculationResult = 0
        displayValue = "0"
        operation = .add
        newValue = nil
    }
    
    mutating func clear() {
        displayValue = "0"
        newValue = nil
        isAllClear = true
    }
    
    private func calculate(operation: BinaryOperator, newValue: Decimal) -> Decimal? {
        guard let calculationResult = calculationResult else {
            return nil
        }
        switch (operation) {
        case .add:
            return calculationResult + newValue
        case .substarct:
            return calculationResult - newValue
        case .divide:
            if newValue == 0 {
               return nil
            }
            return calculationResult / newValue
        case .multiply:
            return calculationResult * newValue
        }
    }
    
    mutating func backWhenSwiped() {
        if displayValue.count > 1 {
            displayValue.removeLast()
        }
    }
}

extension Calculator {
    var buttonLayout: [[Button]] {
        if isAllClear {
            return       [
                [.allClear, .toggle, .percent, .binaryOperator(.divide)],
                [.digit(.seven), .digit(.eight), .digit(.nine), .binaryOperator(.multiply)],
                [.digit(.four), .digit(.five), .digit(.six), .binaryOperator(.substarct)],
                [.digit(.one), .digit(.two), .digit(.three), .binaryOperator(.add)],
                [.digit(.zero), .dot, .equal]
            ]
        } else {
            return [
                 [.clear, .toggle, .percent, .binaryOperator(.divide)],
                 [.digit(.seven), .digit(.eight), .digit(.nine), .binaryOperator(.multiply)],
                 [.digit(.four), .digit(.five), .digit(.six), .binaryOperator(.substarct)],
                 [.digit(.one), .digit(.two), .digit(.three), .binaryOperator(.add)],
                 [.digit(.zero), .dot, .equal]
             ]
        }
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
                return "darkGray"
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
