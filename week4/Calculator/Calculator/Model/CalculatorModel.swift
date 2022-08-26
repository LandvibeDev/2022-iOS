//
//  Calculator.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import Foundation

struct Calculator {
    
    var state: InputState = .newPreviousNumber
    var operation: ArithmeticOperation? {
        willSet {
            if nextNumber != nil { calculate() }
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
            nextNumber = nil
            state = .finishInput
        }
    }
    
    enum InputState {
        case newPreviousNumber
        case newNextNumber
        case ongoingPreviousNumber
        case ongoingNextNumber
        case finishInput
    }
    
    mutating func clickNumber(_ number: Decimal) {
        switch state {
        case .newPreviousNumber, .finishInput:
            previousNumber = number
            state = .ongoingPreviousNumber
        case .newNextNumber:
            nextNumber = number
            state = .ongoingNextNumber
        case .ongoingPreviousNumber:
            previousNumber = joinNumbers(with: number)
        case .ongoingNextNumber:
            nextNumber = joinNumbers(with: number)
        }
    }
    
    mutating func calculate() {
        guard let priorNumber = previousNumber,
              let laterNumber = nextNumber,
              let operation = operation else { return }
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
            if let afterNumber = nextNumber {
                nextNumber = -afterNumber
            } else {
                previousNumber = -priorNumber
            }
        }
    }
    
    mutating func percent() {
        if let priorNumber = previousNumber {
            if let afterNumber = nextNumber {
                nextNumber = afterNumber / 100
            } else {
                previousNumber = priorNumber / 100
            }
        }
    }
    
    mutating func addPoint() {
        if !showingText.contains(".") {
            showingText = showingText + "."
            if showingText.compare("0") == .orderedSame {
                state = .ongoingPreviousNumber
            }
        }
    }
}

extension Calculator {
    
    enum ArithmeticOperation: Identifiable, Equatable {
        case equal
        case plus(Bool)
        case minus(Bool)
        case multiply(Bool)
        case divide(Bool)
        case percent
        case sign
        case clear(clearType)
        case number(Decimal)
        case point
        
        var id: String { return content }
        
        var content: String {
            switch self {
            case .equal:
                return "="
            case .plus:
                return "+"
            case .minus:
                return "-"
            case .multiply:
                return "*"
            case .divide:
                return "/"
            case .percent:
                return "%"
            case .sign:
                return "±"
            case .clear(.displayResult):
                return "C"
            case .clear(.allData):
                return "AC"
            case .number(let value):
                return "\(value)"
            case .point:
                return "."
            }
        }
        
        var isActive: Bool {
            switch self {
            case .plus(let isActive), .multiply(let isActive), .minus(let isActive), .divide(let isActive):
                return isActive
            default:
                return false
            }
        }
        
        var backgroundColor: String {
            switch self {
            case .clear, .percent, .sign:
                return "#A0A0A0"
            case .number, .point:
                return "#323232"
            case .plus, .divide, .multiply, .minus, .equal:
                return isActive ? "#FFFFFF" : "#E99D39"
            }
        }
        
        var textColor: String {
            switch self {
            case .clear, .percent, .sign:
                return "#000000"
            case .plus, .divide, .multiply, .minus, .equal, .number, .point:
                return isActive ? "#E99D39" : "#FFFFFF"
            }
        }
        
        var buttonSize: Int {
            switch self {
            case .number(0):
                return 2
            default:
                return 1
            }
        }
        
        mutating func activeButton(active: Bool) {
            switch self {
            case .divide:
                self = .divide(active)
            case .multiply:
                self = .multiply(active)
            case .minus:
                self = .minus(active)
            case .plus:
                self = .plus(active)
            default:
                break
            }
        }
    }
    
    enum clearType {
        case allData
        case displayResult
    }
}
