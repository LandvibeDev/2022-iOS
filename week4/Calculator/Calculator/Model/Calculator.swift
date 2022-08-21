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
        stack = ["0"]
        inputNumber = "0"
    }
    
    static func percent(number: Double) -> Double {
        return number/100
    }
    
    mutating func toggleSign(targetNumber: Double) -> Void {
        result = (-1) * targetNumber
        displayText = String(targetNumber)
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
                    return
                }
            default:
                result = 0.0
            }
            stack.removeAll()
            inputNumber = String(result)
            displayText = inputNumber
        } else {
            result = 0.0
        }
    }
    
    mutating func click(inputText: String) -> Void {
        if inputText == "AC" {
            result = 0
            displayText = "0"
            stack.removeAll()
            stack.append("0")
            inputNumber = "0"
            return
        } else if inputText == "=" {
            stack.append(inputNumber)
            equl()
            stack.append(String(result))
            return
        } else if inputText == "+/-" {
            if stack.count == 1 && Double(stack.last!) == 0 {
                stack.removeLast()
                stack.append(inputNumber)
            }
            stack.append(String(Double(stack.popLast() ?? "0")! * (-1)))
            displayText = stack.last
            result = Double(displayText)!
            return
        } else if inputText == "%" {
            print(self)
            if stack.count == 1 && (stack.last == "0" || stack.last == "0.0") {
                stack.removeLast()
                stack.append(String(Double(inputNumber)! / 100))
            } else {
//                stack.append(String(Double(stack.popLast()!)! / 100))
            }
            displayText = stack.last
            return
        }
        if isNumber(symbol: inputText) {
            if inputNumber == "0" {
                inputNumber.removeAll()
            }
            inputNumber += inputText
            displayText = inputNumber
        } else if !isNumber(symbol: inputText) {
            if !isNumber(symbol: stack.last ?? "0") {
                stack.removeLast()
            } else {
                if stack.count == 1 && stack.last == "0" {
                    stack.removeLast()
                    stack.append(inputNumber)
                }
            }
            stack.append(inputText)
            inputNumber.removeAll()
            if stack.count >= 3 {
                equl()
            }
        } else if !isNumber(symbol: stack.last ?? "0") && isNumber(symbol: inputText) {
            inputNumber += inputText
        }
    }
    
    func isNumber(symbol: String) -> Bool {
        if "0" <= symbol, symbol <= "9" {
            return true
        }
        return false
    }
}
