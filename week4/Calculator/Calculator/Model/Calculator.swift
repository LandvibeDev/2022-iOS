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
    private(set) var inputNumber: String!
    
    init() {
        result = 0
        displayText = "0"
        stack = []
        inputNumber = ""
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
            case "×":
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
            //test log
            print("in equl###########################")
            print(stack)
            stack.removeAll()
            inputNumber.removeAll()
            inputNumber = String(result)
            displayText = inputNumber
            //test log
            print(self)
        }
        result = 0.0
    }
    
    mutating func click(inputText: String) -> Void {
        print(self)
        if inputText == "AC" {
            result = 0
            displayText = "0"
            stack.removeAll()
            inputNumber = ""
            print(self)
            return
        }
        if inputText == "=" {
            stack.append(inputNumber)
            //test log
            print(self)
            
            equl()
            //test log
            print(stack)
            return
        } else {
            if isNumber(symbol: inputText) {
                inputNumber += inputText
                displayText = inputNumber
            } else if !isNumber(symbol: inputText) {
                if !isNumber(symbol: stack.last ?? "0") {
                    stack.removeLast()
                } else {
                    stack.append(inputNumber)
                }
                stack.append(inputText)
                inputNumber.removeAll()
            } else if !isNumber(symbol: stack.last ?? "0") && isNumber(symbol: inputText) {
                inputNumber += inputText
            }
        }
    }
    
    func isNumber(symbol: String) -> Bool {
        if "0" <= symbol, symbol <= "9" {
            return true
        }
        return false
    }
}
