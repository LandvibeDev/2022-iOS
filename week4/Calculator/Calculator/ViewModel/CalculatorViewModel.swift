//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/16.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published private var calculator: Calculator
    let symbols: [[Symbol.Text]]
    var lastSymbol: String {
        if result.isEmpty {
            return "0"
        } else {
            return (String)(result.last!)
        }
    }
    var result: String {
        return "\(calculator.result)"
    }
    var displayText: String {
        calculator.displayText
    }
    var expression: String
    
    init() {
        calculator = Calculator()
        symbols = [[.addition, .toggleSign, .percent, .divide] ,
                   [.seven, .eight, .nine, .multiply],
                   [.four, .five, .six, .substract],
                   [.one, .two, .three, .addition],
                   [.zero, .point, .equal]]
        expression = "0"
    }
    
    func click(inputText: String) {
        if inputText == "AC" {
            calculator = Calculator()
        }
        calculator.click(inputText: inputText)
    }
}
