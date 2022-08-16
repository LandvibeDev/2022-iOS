//
//  Operator.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/16.
//

import Foundation

struct Operator<TypeOfNumber: FloatingPoint> {
    private(set) var symbol: String
    private(set) var firstNumber: TypeOfNumber
    private(set) var secondNumber: TypeOfNumber
    
    init(firstNumber: TypeOfNumber, secondNumber: TypeOfNumber, symbol: String) {
        self.symbol = symbol
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
    }
    
    func addtion(firstNumber: TypeOfNumber, secondNumber: TypeOfNumber) -> TypeOfNumber {
        return firstNumber + secondNumber
    }
    
    func substract(firstNumber: TypeOfNumber, secondNumber: TypeOfNumber) -> TypeOfNumber {
        return firstNumber - secondNumber
    }
    
    func multiply(firstNumber: TypeOfNumber, secondNumber: TypeOfNumber) -> TypeOfNumber {
        return firstNumber * secondNumber
    }
    
    func divide(firstNumber: TypeOfNumber, secondNumber: TypeOfNumber) -> TypeOfNumber? {
        if secondNumber != 0 {
            return firstNumber / secondNumber
        } else {
            return nil
        }
    }
    
    func toggleSign(targetNumber: TypeOfNumber) -> TypeOfNumber {
        return (-1) * targetNumber
    }

    
    
    
}
