//
//  Calculator.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import Foundation

struct Calculator {
    
    // MARK: Propery(ies)
    
    private(set) var displayValue = "0"
    private(set) var isAllClear = true
    private var calculationResult: Decimal? = 0
    private var newValue: Decimal? = nil
    private var `operator`: BinaryOperator? = .add
    private var isPreOperatorEqual = false
    private var isCalculationResultIsNil: Bool {
        calculationResult == nil
    }
    
    // MARK: Method(s)
    
    mutating func setDigit(_ newValue: Digit) {
        if self.newValue == nil || isCalculationResultIsNil {
            displayValue = String(describing: newValue.rawValue)
            self.newValue = Decimal(string: displayValue)
            isAllClear = false
        } else {
            if String(describing: self.newValue ?? 0).count >= 9  {
                return
            }
            displayValue = displayValue.appending(String(describing: newValue.rawValue))
            self.newValue = Decimal(string: displayValue)
        }
    }
    
    mutating func setOperator(_ newOperator: BinaryOperator) {
        if isPreOperatorEqual {
            `operator` = nil
            newValue = nil
            isPreOperatorEqual = false
        }
        proveAndCalculate(newOperator: newOperator)
        self.newValue = nil
        self.`operator` = newOperator
    }
    
    mutating func equal() {
        proveAndCalculate(newOperator: nil)
    }
    
    mutating func proveAndCalculate(newOperator: BinaryOperator?) {
        let isEqual = newOperator == nil
        guard let `operator` = `operator`, let newValue = newValue else {
            return
        }
        if isEqual {
            isPreOperatorEqual = true
        }
        calculationResult = calculate(`operator`, newValue)
        guard let calculationResult = calculationResult else {
            displayValue = "오류"
            self.newValue = nil
            return
        }
        displayValue = String(describing: calculationResult)
    }
        
    mutating func dot() {
        if displayValue.contains(".") || isCalculationResultIsNil {
            return
        }
        displayValue = displayValue.appending(".")
        isAllClear = false
        newValue = Decimal(string: displayValue)
    }
    
    mutating func percent() {
        percentOrToggleDisplayNumberSign(isToggle: false)
    }
    
    mutating func toggleDisplayNumberSign() {
        percentOrToggleDisplayNumberSign(isToggle: true)
    }
    
    private mutating func percentOrToggleDisplayNumberSign(isToggle: Bool) {
        guard let calculationResult = calculationResult else {
            return
        }
        let operand = isToggle ? -1 : 0.01
        if let newValue = newValue, !isPreOperatorEqual {
            displayValue = String(describing: newValue * Decimal(operand))
            self.newValue = Decimal(string: displayValue)
        } else {
            displayValue = String(describing: calculationResult * Decimal(operand))
            self.calculationResult = Decimal(string: displayValue)
        }
    }
    
    mutating func allClear() {
        clear()
        isPreOperatorEqual = false
        calculationResult = 0
        `operator` = .add
    }
    
    mutating func clear() {
        displayValue = "0"
        newValue = nil
        isAllClear = true
    }
    
    mutating func undoWhenDragged() {
        let isNewValueNil = newValue == nil
        if displayValue.count == 1 {
            displayValue = "0"
            assignValueWhenUndo(isNewValueNil)
        } else {
            displayValue.removeLast()
            assignValueWhenUndo(isNewValueNil)
        }
    }
    
    private mutating func assignValueWhenUndo(_ newValueIsNil: Bool) {
        if newValueIsNil {
            calculationResult = Decimal(string: displayValue)
        } else {
            newValue = Decimal(string: displayValue)
        }
    }
    
    private func calculate(_ operation: BinaryOperator, _ newValue: Decimal) -> Decimal? {
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
}

extension Calculator {
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
