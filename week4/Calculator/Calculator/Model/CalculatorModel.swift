//
//  Calculator.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import Foundation

struct Calculator {
    
    var state: InputState = .firstNumber(isStart: false)
    var `operator`: ArithmeticOperation? {
        
        willSet {
            
            if state == .secondNumber(isStart: true) { calculate() }
        }
    }
    var showingText: String
    private(set) var previousNumber: Decimal? {
        
        didSet {
            
            guard let previousNumber = previousNumber else { return }
            showingText = "\(previousNumber)"
        }
    }
    private(set) var nextNumber: Decimal? {
        
        didSet {
            
            guard let nextNumber = nextNumber else { return }
            showingText = "\(nextNumber)"
        }
    }
    private(set) var result: Decimal {
        
        didSet {
            
            showingText = "\(result)"
            previousNumber = result
            state = .finishInput
        }
    }
    
    enum InputState: Equatable {
        
        case firstNumber(isStart: Bool)
        case secondNumber(isStart: Bool)
        case finishInput
    }
    
    mutating func clickNumber(_ number: Decimal) {
        
        switch state {
            
        case .firstNumber(false), .finishInput:
            previousNumber = number
            state = .firstNumber(isStart: true)
        case .secondNumber(isStart: false):
            nextNumber = number
            state = .secondNumber(isStart: true)
        case .firstNumber(isStart: true):
            previousNumber = joinNumbers(with: number)
        case .secondNumber(isStart: true):
            nextNumber = joinNumbers(with: number)
        }
    }
    
    mutating func calculate() {
        
        guard let priorNumber = previousNumber,
              let laterNumber = nextNumber,
              let operation = `operator` else { return }
        state = .finishInput
        switch operation {
            
        case .multiply:
            result = priorNumber * laterNumber
        case .divide:
            result = priorNumber / laterNumber
        case .minus:
            result = priorNumber - laterNumber
        case .plus:
            result = priorNumber + laterNumber
        default:
            print("error")
        }
    }
    
    mutating func joinNumbers(with nextElement: Decimal) -> Decimal {
        
        let joinedString = showingText + "\(nextElement)"
        guard let joinedNumber = Decimal(string: joinedString) else { return 0 }
        return joinedNumber
    }
    
    mutating func changeSign() {
        
        if let priorNumber = previousNumber {
            
            if let afterNumber = nextNumber { nextNumber = -afterNumber }
            else { previousNumber = -priorNumber}
        }
    }
    
    mutating func percent() {
        
        if let priorNumber = previousNumber {
            
            if let afterNumber = nextNumber { nextNumber = afterNumber / 100 }
            else { previousNumber = priorNumber / 100 }
        }
    }
    
    mutating func addPoint() {
        
        if !showingText.contains(".") {
            
            showingText = showingText + "."
            if showingText.compare("0") == .orderedSame {
                
                state = .firstNumber(isStart: true)
            }
        }
    }
}

extension Calculator {
    
    enum ArithmeticOperation: Identifiable, Equatable {
        
        case equal
        case plus
        case minus
        case multiply
        case divide
        case percent
        case sign
        case clear
        case number(Decimal)
        case point
        
        var id: String {
            switch self {
            case .equal:
                return "equal"
            case .plus:
                return "plus"
            case .minus:
                return "minus"
            case .multiply:
                return "multiply"
            case .divide:
                return "divide"
            case .percent:
                return "percent"
            case .sign:
                return "sign"
            case .clear:
                return "clear"
            case .number(let decimal):
                return "\(decimal)"
            case .point:
                return "point"
            }
        }
        
    }
}
