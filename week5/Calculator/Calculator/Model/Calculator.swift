//
//  Calculator.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import Foundation

struct Calculator {
    
    // MARK: Alias(es)
    
    typealias BinaryOperator = CalculatorManager.BinaryOperator
    typealias Digit = CalculatorManager.Digit
    
    // MARK: Propery(ies)
    
    private(set) var displayValue = "0"
    private(set) var isAllClear = true
    private var calculationResult: Decimal? = 0
    private var newValue: Decimal? = nil
    private var operation: BinaryOperator? = .add
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
    
    mutating func setOperation(_ newOperation: BinaryOperator) {
        guard let operation = operation, let newValue = newValue else {
            self.operation = newOperation
            return
        }
        calculationResult = calculate(operation, newValue)
        guard let calculationResult = calculationResult else {
            displayValue = "오류"
            return
        }
        displayValue = String(describing: calculationResult)
        self.newValue = nil
        self.operation = newOperation
    }
    
    mutating func equal() {
        guard let operation = operation, let newValue = newValue else {
            return
        }
        calculationResult = calculate(operation, newValue)
        guard let calculationResult = calculationResult else {
            displayValue = "오류"
            self.newValue = nil
            return
        }
        displayValue = String(describing: calculationResult)
        self.newValue = nil
        self.operation = nil
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
        guard let calculationResult = calculationResult else {
            return
        }
        if let newValue = newValue {
            displayValue = String(describing: newValue * 0.01)
            self.newValue = Decimal(string: displayValue)
        } else {
            displayValue = String(describing: calculationResult * 0.01)
            self.calculationResult = Decimal(string: displayValue)
        }
    }
    
    mutating func toggle() {
        guard let calculationResult = calculationResult else {
            return
        }
        if let newValue = newValue {
            displayValue = String(describing: -newValue)
            self.newValue = Decimal(string: displayValue)
        } else {
            displayValue = String(describing: -calculationResult)
            self.calculationResult = Decimal(string: displayValue)
        }
    }
    
    mutating func allClear() {
        displayValue = "0"
        newValue = nil
        calculationResult = 0
        operation = .add
    }
    
    mutating func clear() {
        displayValue = "0"
        newValue = nil
        isAllClear = true
    }
    
    mutating func undoWhenDragged() {
        if newValue == nil {
            if displayValue.count > 1 {
                displayValue.removeLast()
                calculationResult = Decimal(string: displayValue)
            } else if displayValue.count == 1 {
                displayValue = "0"
                calculationResult = Decimal(string: displayValue)
            }
        } else {
            if displayValue.count > 1 {
                displayValue.removeLast()
                newValue = Decimal(string: displayValue)
            } else if displayValue.count == 1 {
                displayValue = "0"
                newValue = Decimal(string: displayValue)
            }
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
