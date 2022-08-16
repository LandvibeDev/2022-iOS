//
//  Calculator.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/17.
//

import Foundation

struct Calculator<TypeOfNumber: FloatingPoint> {
    //    private(set) var symbol: String
    //    private(set) var firstNumber: TypeOfNumber
    //    private(set) var secondNumber: TypeOfNumber
    //
    //    init(firstNumber: TypeOfNumber, secondNumber: TypeOfNumber, symbol: String) {
    //        self.symbol = symbol
    //        self.firstNumber = firstNumber
    //        self.secondNumber = secondNumber
    //    }
        
        static func addtion(firstNumber: TypeOfNumber, secondNumber: TypeOfNumber) -> TypeOfNumber {
            return firstNumber + secondNumber
        }
        
        static func substract(firstNumber: TypeOfNumber, secondNumber: TypeOfNumber) -> TypeOfNumber {
            return firstNumber - secondNumber
        }
        
        static func multiply(firstNumber: TypeOfNumber, secondNumber: TypeOfNumber) -> TypeOfNumber {
            return firstNumber * secondNumber
        }
        
        static func divide(firstNumber: TypeOfNumber, secondNumber: TypeOfNumber) -> TypeOfNumber? {
            if secondNumber != 0 {
                return firstNumber / secondNumber
            } else {
                return nil
            }
        }
        
        static func toggleSign(targetNumber: TypeOfNumber) -> TypeOfNumber {
            return (-1) * targetNumber
        }
        
        static func allCancel() -> [String] {
            return []
        }
        
        

        
}
