//
//  NumberPad.swift
//  Calculator
//
//  Created by changgyo seo on 2022/08/26.
//

import SwiftUI

struct CalculatorButton: View {
    
    @EnvironmentObject var calculatorManager: CalculatorManager
    var buttonData: Calculator.ArithmeticOperation
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                RoundedRectangle(cornerRadius: cornerRadius(in: geometry.size))
                    .foregroundColor(backGroundColor)
                Text(content)
                    .foregroundColor(textColor)
                    .font(font(in: geometry.size))
            }
        }
    }
    
    private func cornerRadius(in size: CGSize) -> CGFloat {
        
        size.width * DrawConstans.buttonCornerRadius
    }
    
    private func font(in size: CGSize) -> Font {
        
        Font.system(size: size.height * DrawConstans.fontSizeScale)
    }
    
    private var textColor: Color {
        
        switch buttonData {
            
        case .minus, .plus, .divide, .multiply, .equal, .number, .point:
            if calculatorManager.calculateModel.operator == buttonData &&
                calculatorManager.isRecentedOperator {
                
                return .init(hex: "#E99D39")
            }
            else { return .init(hex: "#FFFFFF") }
        default:
            return .init(hex: "#000000")
        }
    }
    private var backGroundColor: Color {
        
        switch buttonData {
            
        case .minus, .plus, .divide, .multiply, .equal:
            if calculatorManager.calculateModel.operator == buttonData &&
                calculatorManager.isRecentedOperator {
                
                return .init(hex: "#FFFFFF")
            }
            else { return .init(hex: "#E99D39") }
        case .number(_), .point:
            return .init(hex: "#323232")
        case .clear, .percent, .sign:
            return .init(hex: "#A0A0A0")
        }
    }
    var content: String {
        
        switch buttonData {
            
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
        case .clear:
            if calculatorManager.showingText != "0" { return "C" }
            return "AC"
        case .number(let value):
            return "\(value)"
        case .point:
            return "."
        }
    }
    
}

extension CalculatorButton {
    
    private enum DrawConstans {
        static let buttonCornerRadius = 0.5
        static let fontSizeScale = 0.4
    }
}
