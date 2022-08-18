//
//  Calculator.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/17.
//

import Foundation
import SwiftUI

struct Calculator {
    private(set) var displayText: String!
    private(set) var result: Double
    private(set) var stack: [String]
    
    init() {
        result = 0
        displayText = "0"
        stack = ["0"]
    }
    
    static func percent(number: Double) -> Double {
        return number/100
    }
    
    static func toggleSign(targetNumber: Double) -> Double {
        return (-1) * targetNumber
    }
    
    static func allClear() -> Calculator{
        return Calculator.init()
    }
    
    mutating func equl() -> Void {
        if stack.count == 3 {
            let secondNumber: Double! = (Double)(stack.popLast()!)
            let operatorSymbol = stack.popLast()!
            let firstNumber: Double! = (Double)(stack.popLast()!)!
            
            switch operatorSymbol {
            case "+":
                result = firstNumber + secondNumber
            case "-":
                result = firstNumber - secondNumber
            case "*":
                result = firstNumber * secondNumber
            case "÷":
                if secondNumber != 0 {
                    result = firstNumber / secondNumber
                } else {
                    displayText = "Error"
                    result = 0.0
                }
            default:
                result = 0.0
            }
            stack.append(String(result))
        }
        result = 0.0
    }
    
    mutating func click(inputText: String) -> Void {
        if inputText == "AC" {
            result = 0
            displayText = "0"
            stack = ["0"]
        }
        if isNumber(symbol: stack.last!) && isNumber(symbol: inputText) {
            displayText += inputText
            result = Double(displayText)!
        } else if isNumber(symbol: stack.last!) && !isNumber(symbol: inputText) {
            stack.append(displayText)
            stack.append(inputText)
        } else if isNumber(symbol: stack.last!) && inputText == "=" {
            equl()
        }
    }
    
    func isNumber(symbol: String) -> Bool {
        if "0" <= symbol, symbol <= "9" {
            return true
        }
        return false
    }
}
