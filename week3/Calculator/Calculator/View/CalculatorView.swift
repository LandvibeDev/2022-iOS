//
//  ContentView.swift
//  Calculator
//
//  Created by changgyo seo on 2022/08/14.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject private var calculator: Calculator
    
    var body: some View {
        VStack {
            Spacer()
            CalculatorResultView()
            VGridWithUIScreenWidth(items: calculator.buttonList,
                                   columnsCount: DrawConstans.veticalModlColumnsCount) { item in
                ButtonView(buttonData: item)
            }
        }
    }
}

extension CalculatorView {
    enum Button: Identifiable, Equatable {
        case equal
        case plus
        case minus
        case multiply
        case divide
        case percent
        case sign
        case clear(clearType)
        case numberOrDot(Decimal)
        case none
        
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
            case .numberOrDot(let value):
                return "\(value)"
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
            case .plus, .divide, .multiply, .minus:
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
            case .plus, .divide, .multiply, .minus:
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
            case .numberOrDot(0):
                return 2
            default:
                return 1
            }
        }
        
        mutating func activeButton(active: Bool) {
            switch self {
            case .divide:
                self = .divide
            case .multiply:
                self = .multiply
            case .minus:
                self = .minus
            case .plus:
                self = .plus
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

extension CalculatorView {
    enum DrawConstans {
        static let veticalModlColumnsCount = 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
