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
    private var calculationResult: Decimal? = 0
    private var newValue: Decimal? = nil
    private var operation: BinaryOperator? = .add
    private(set) var isAllClear = true
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
            if String(describing: self.newValue!).count >= 9  {
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
        if operation == BinaryOperator.divide, newValue == 0 {
            calculationResult = nil
            displayValue = "오류"
            self.newValue = nil
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
    
    mutating func backWhenDragged() {
        if newValue != nil {
            if displayValue.count > 1 {
                displayValue.removeLast()
                newValue = Decimal(string: displayValue)
            } else if displayValue.count == 1 {
                displayValue = "0"
                newValue = Decimal(string: displayValue)
            }
        } else {
            if displayValue.count > 1 {
                displayValue.removeLast()
                calculationResult = Decimal(string: displayValue)
            } else if displayValue.count == 1 {
                displayValue = "0"
                calculationResult = Decimal(string: displayValue)
            }
        }
    }
}
