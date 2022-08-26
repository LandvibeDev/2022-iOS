//
//  CaculatorManager.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import SwiftUI

class CalculatorManager: ObservableObject {
    
    @Published private var calculateModel = create()
    @Published var buttonList: [Calculator.ArithmeticOperation] =
    [
        .clear(.allData), .sign, .percent, .divide(false),
        .number(7), .number(8), .number(9), .multiply(false),
        .number(4), .number(5), .number(6), .minus(false),
        .number(1), .number(2), .number(3), .plus(false),
        .number(0), .point, .equal
    ]
    
    var showingText: String {
        get {
            if calculateModel.showingText != "0" {
                guard let clearIndex = buttonList.firstIndex(of: .clear(.allData)) else { return calculateModel.showingText }
                buttonList[clearIndex] = .clear(.displayResult)
            }
            else {
                guard let clearIndex = buttonList.firstIndex(of: .clear(.displayResult)) else { return calculateModel.showingText }
                buttonList[clearIndex] = .clear(.allData)
            }
            return calculateModel.showingText
        }
        set { calculateModel.showingText = newValue }
    }
    
    private static func create() -> Calculator {
        return Calculator(showingText: "0", result: 0)
    }
    
    // MARK: - Intentions
    
    func click(_ clickType: Calculator.ArithmeticOperation) {
        switch clickType {
        case .number(let decimal):
            print(decimal)
            for index in buttonList.indices {
                if buttonList[index].isActive == true {
                    switch buttonList[index] {
                    case .plus, .minus, .divide, .multiply:
                        buttonList[index].activeButton(active: false)
                    default:
                        print("error")
                    }
                }
            }
            clickNumber(decimal)
        case .equal:
            calculate()
        case .clear(.allData):
            clear()
        case .clear(.displayResult):
            showingText = "0"
        case .sign:
            changeSign()
        case .percent:
            percent()
        case .point:
            addPoint()
        default:
            for index in buttonList.indices {
                if buttonList[index] == clickType {
                    buttonList[index].activeButton(active: true)
                }
                else {
                    buttonList[index].activeButton(active: false)
                }
            }
            clickOperation(clickType)
        }
    }
    
    func clickNumber(_ number: Decimal) {
        calculateModel.clickNumber(number)
    }
    
    func clickOperation(_ operation: Calculator.ArithmeticOperation?) {
        calculateModel.operation = operation
        calculateModel.state = .newNextNumber
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
    
    func percent() {
        calculateModel.percent()
    }
    
    func addPoint() {
        calculateModel.addPoint()
    }
}
