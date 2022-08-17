//
//  Calculator.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/17.
//

import Foundation

/*
 해야할 것
 */

struct Calculator {
    //    private(set) var symbol: String
    //    private(set) var firstNumber: TypeOfNumber
    //    private(set) var secondNumber: TypeOfNumber
    //
    //    init(firstNumber: TypeOfNumber, secondNumber: TypeOfNumber, symbol: String) {
    //        self.symbol = symbol
    //        self.firstNumber = firstNumber
    //        self.secondNumber = secondNumber
    //    }
    
    private(set) var result: Int
    
    init() {
        result = 0
    }
    
    static func addtion(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
    
    static func substract(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
    
    static func multiply(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
    
    static func divide(firstNumber: Double, secondNumber: Double) -> Double? {
        if secondNumber != 0 {
            return firstNumber / secondNumber
        } else {
            return nil
        }
    }
    
    static func toggleSign(targetNumber: Double) -> Double {
        return (-1) * targetNumber
    }
    
    static func allCancel() -> [String] {
        return []
    }
    
    
    
    
}
