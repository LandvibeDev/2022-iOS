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
    var displayText: String {
        return calculator.displayText
    }
    
    init() {
        calculator = Calculator()
        symbols = [[.addition, .toggleSign, .percent, .divide] ,
                   [.seven, .eight, .nine, .multiply],
                   [.four, .five, .six, .substract],
                   [.one, .two, .three, .addition],
                   [.zero, .point, .equal]]
    }
    
    func click(inputText: String) {
        calculator.click(inputText: inputText)
    }
}
