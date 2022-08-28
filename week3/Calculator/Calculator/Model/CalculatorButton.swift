//
//  ButtonModel.swift
//  Calculator
//
//  Created by changgyo seo on 2022/08/21.
//

enum CalculatorButton: Identifiable, Equatable {
    case equal
    case add(Bool)
    case subtract(Bool)
    case multiply(Bool)
    case divide(Bool)
    case percent
    case sign
    case clear(clearType)
    case numberOrDot(String)
    case none
    
    var id: String { return content }
    
    var content: String {
        switch self {
        case .equal:
            return "="
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .multiply:
            return "*"
        case .divide:
            return "/"
        case .percent:
            return "%"
        case .sign:
            return "±"
        case .clear(.displayresult):
            return "C"
        case .clear(.alldata):
            return "AC"
        case .numberOrDot(let value):
            return value
        default:
            return ""
        }
    }

    var backgroundColor: (red: Double, green: Double, blue: Double, opacity: Double) {
        switch self {
        case .clear, .percent, .sign:
            return (160 / 255, 160 / 255, 160 / 255 , 1)
        case .numberOrDot:
            return (50 / 255, 50 / 255, 50 / 255, 1)
        case .add, .divide, .multiply, .subtract:
            if isActive {
                return (1, 1, 1, 1)
            }
            else {
                return (233 / 255, 157 / 255, 57 / 255, 1)
            }
        default:
            return (233 / 255, 157 / 255, 57 / 255, 1)
        }
    }
    
    var textColorColor: (red: Double, green: Double, blue: Double, opacity: Double) {
        switch self {
        case .clear, .percent, .sign:
            return (0, 0, 0, 1)
        case .add, .divide, .multiply, .subtract:
            if isActive {
                return (233 / 255, 157 / 255, 57 / 255, 1)
            }
            else {
                return (1, 1, 1, 1)
            }
        default:
            return (1, 1, 1, 1)
        }
    }
    
    var buttonSize: Int {
        switch self {
        case .numberOrDot("0"):
            return 2
        default:
            return 1
        }
    }
    
    var isActive: Bool {
        switch self {
        case .add(let isActive):
            return isActive
        case .subtract(let isActive):
            return isActive
        case .multiply(let isActive):
            return isActive
        case .divide(let isActive):
            return isActive
        default:
            return false
        }
    }
    
    mutating func activeButton(active: Bool) {
        switch self {
        case .divide:
            self = .divide(active)
        case .multiply:
            self = .multiply(active)
        case .subtract:
            self = .subtract(active)
        case .add:
            self = .add(active)
        default:
            break
        }
    }
}

extension CalculatorButton {
    enum clearType {
        case alldata
        case displayresult
    }
}
