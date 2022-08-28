//
//  ViewModel.swift
//  Calculator
//
//  Created by changgyo seo on 2022/08/15.
//

import Foundation

class Calculator: ObservableObject {
    @Published private(set) var displayResult: String
    @Published private(set) var model: Calculate
    @Published private(set) var buttonList: [CalculatorButton]
    private(set) var activedOperand: CalculatorButton {
        didSet {
            switch activedOperand {
            case .clear(.displayresult):
                guard let clearIndex = buttonList.firstIndex(where: { $0 == .clear(.displayresult)}) else { return }
                buttonList[clearIndex] = .clear(.alldata)
            default:
                return
            }
        }
    }
    
    private var isStartNumber: Bool
    private var occuredError: Bool
    
    init() {
        model = Calculate()
        displayResult = "0"
        activedOperand = .numberOrDot("0")
        isStartNumber = false
        occuredError = false
        buttonList = [
            .clear(.alldata), .sign, .percent, .divide(false),
            .numberOrDot("7"), .numberOrDot("8"), .numberOrDot("9"), .multiply(false),
            .numberOrDot("4"), .numberOrDot("5"), .numberOrDot("6"), .subtract(false),
            .numberOrDot("1"), .numberOrDot("2"), .numberOrDot("3"), .add(false),
            .numberOrDot("0"), .numberOrDot("."), .equal
        ]
    }
    
    func slideToRemove() {
        displayResult.removeWithDecimal()
    }
    
    func tapButton(of buttonValue: CalculatorButton) {
        if let activedButtonIndex = buttonList.firstIndex(where: { $0 == activedOperand }) {
            buttonList[activedButtonIndex].activeButton(active: false)
        }
        guard let tapOperandIndex = buttonList.firstIndex(where: { $0 == buttonValue }) else { return }
        
        buttonList[tapOperandIndex].activeButton(active: true)
        let newButtonValue = buttonList[tapOperandIndex]
        
        switch newButtonValue {
        case .equal:
            tapEqual()
        case .sign:
            tapSign()
        case .clear:
            tapClear(is: newButtonValue)
        case .numberOrDot(let number):
            tapNumberOrDot(number: number)
        default:
            tapOperand(with: newButtonValue)
        }
    }
}

// MARK: Extesion CalculatorViewModel with TapButtonFunction

extension Calculator {
    private func tapEqual() {
        activedOperand = .equal;
        isStartNumber = false
        if model.calculate(to: displayResult.stringToDouble()) == .none, !occuredError {
            displayResult = model.calculateResult.doubleToStringWithDecimal()
        }
        else {
            occuredError = true
            displayResult = "오류"
        }
    }
    
    private func tapSign() {
        activedOperand = .sign;
        if displayResult.contains("-") {
            displayResult.removeFirst()
        }
        else {
            displayResult = "-" + (displayResult)
        }
    }
    
    private func tapClear(is butonValue: CalculatorButton) {
        activedOperand = butonValue
        displayResult = "0"
        if butonValue == .clear(.alldata) {
            model.allClear()
            occuredError = false
        }
    }
    
    private func tapNumberOrDot(number: String) {
        if !isStartNumber {
            displayResult = ""
        }
        isStartNumber = true
        displayResult.appendWithDeciaml(number)
        guard let clearIndexForChange = buttonList.firstIndex(where: { $0 == .clear(.alldata) }) else { return }
        buttonList[clearIndexForChange] = .clear(.displayresult)
    }
    
    private func tapOperand(with buttonValue: CalculatorButton) {
        if isStartNumber {
            switch activedOperand {
            case .add, .subtract, .multiply, .divide, .percent:
                tapEqual()
            default:
                break;
            }
        }
        isStartNumber = false
        activedOperand = buttonValue
        model.currentNumber = displayResult.stringToDouble()
        model.currentOperand = buttonValue
    }
}
