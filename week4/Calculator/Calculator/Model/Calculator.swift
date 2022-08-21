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
            isAllClear = false //어떤 값을 넣든 Clear보여주도록
        } else { // 이어붙이는 경우 ex) 123
            displayValue = displayValue.appending(String(describing: newValue.rawValue))
            self.newValue = Decimal(string: displayValue)
        }
    }
    
    mutating func setOperation(_ newOperation: BinaryOperator) {
        guard let operation = operation, let newValue = newValue else { //세팅 되어 있지않으면
            self.operation = newOperation //세팅만
            return
        }
        calculationResult = calculate(operation: operation, newValue: newValue) //계산
        guard let calculationResult = calculationResult else { //오류일 경우
            displayValue = "오류"
            return
        }
        displayValue = String(describing: calculationResult)
        self.newValue = nil //new Value에 nil 넣어줘서 다른 연산 눌러도 연산 안되도록 해줌
        self.operation = newOperation
    }
    
    mutating func equal() {
        guard let operation = operation, let newValue = newValue else { return } //세팅 안되어있는경우
        if operation == BinaryOperator.divide, newValue == 0 { //divide by zero exception
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
        if displayValue.contains(".") || isCalculationResultIsNil { return } //이미 소수
        displayValue = displayValue.appending(".")
        isAllClear = false
        newValue = Decimal(string: displayValue)
    }
    
    mutating func percent() {
        guard let calculationResult = calculationResult else {
            return
        }
        guard let newValue = newValue else { //새 입력값에 percent
            displayValue = String(describing: calculationResult * 0.01)
            self.calculationResult = Decimal(string: displayValue)
            return
        }
        displayValue = String(describing: newValue * 0.01) // calculationResult값에
        self.newValue = Decimal(string: displayValue)
    }
    
    mutating func toggle() {
        guard let calculationResult = calculationResult else {
            return
        }
        guard let newValue = newValue else { //새 입력값에 toggle
            displayValue = String(describing: -calculationResult)
            self.calculationResult = Decimal(string: displayValue)
            return
        }
        displayValue = String(describing: newValue) //result 값에 toggle
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
