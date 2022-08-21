//
//  CalculateModel.swift
//  Calculator
//
//  Created by changgyo seo on 2022/08/16.
//

struct Calculate {
    var calculateResult: Double = 0
    var currentNumber: Double = 0
    var currentOperand: CalculatorButton? = .add(false)
    
    mutating func calculate(to value: Double) -> calculateError {
        switch currentOperand {
        case .add:
            calculateResult = currentNumber + value
        case .subtract:
            calculateResult = currentNumber - value
        case .divide:
            if value != 0 { calculateResult = currentNumber / value }
            else { return .divideZero }
        case .multiply:
            calculateResult = currentNumber * value
        case .percent:
            calculateResult = currentNumber / 100
        default:
            return .invalidInput
        }
        return .none
    }
    
    mutating func allClear() {
        calculateResult = 0
        currentOperand = .add(false)
        currentNumber = 0
    }
}

extension Calculate {
    enum calculateError {
        case none
        case divideZero
        case invalidInput
    }
}
