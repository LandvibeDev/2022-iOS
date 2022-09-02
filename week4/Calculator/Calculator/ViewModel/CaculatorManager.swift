//
//  CaculatorManager.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import SwiftUI

class CalculatorManager: ObservableObject {
    
    @Published private(set) var calculateModel = create()
    private(set) var isRecentedOperator: Bool = false
    
    var showingText: String {
        get { calculateModel.showingText }
        set { calculateModel.showingText = newValue }
    }
    private static func create() -> Calculator {
        return Calculator(showingText: "0", result: 0)
    }
    
    // MARK: - Intentions
    
    func click(_ clickType: Calculator.ArithmeticOperation) {
        
        isRecentedOperator = false
        switch clickType {
            
        case .number(let decimal):
            click(decimal)
        case .equal:
            calculate()
        case .clear:
            if showingText != "0" { showingText = "0"}
            else { clear() }
        case .sign:
            changeSign()
        case .percent:
            percent()
        case .point:
            addPoint()
        default:
            isRecentedOperator = true
            click(operation: clickType)
        }
    }
    
    func click(_ number: Decimal) {
        
        calculateModel.clickNumber(number)
    }
    
    func click(operation: Calculator.ArithmeticOperation?) {
        
        calculateModel.`operator` = operation
        if calculateModel.state == .finishInput {
            
            calculateModel.state = .secondNumber(isStart: false)
        }
        else if calculateModel.state == .firstNumber(isStart: true) {
            
            calculateModel.state = .secondNumber(isStart: false)
        }
        else {  calculateModel.state = .firstNumber(isStart: false)  }
    }
    
    func calculate() {
        calculateModel.calculate()
    }
    
    func clear() {
        calculateModel = CalculatorManager.create()
    }
    
    func changeSign() {
        calculateModel.changeSign()
    }
    
    func slideToRemove() {
        showingText.removeWithDecimal()
    }
    
    func percent() {
        calculateModel.percent()
    }
    
    func addPoint() {
        calculateModel.addPoint()
    }
}
