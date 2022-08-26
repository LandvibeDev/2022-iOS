//
//  ButtonView.swift
//  Calculator
//
//  Created by changgyo seo on 2022/08/26.
//

import SwiftUI

struct NumberPad: View {
    
    var buttonData: Calculator.ArithmeticOperation
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius(in: geometry.size))
                    .foregroundColor(Color(hex: buttonData.backgroundColor))
                Text(buttonData.content)
                    .foregroundColor(Color(hex: buttonData.textColor))
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
}

extension NumberPad {
    
    private enum DrawConstans {
        static let buttonCornerRadius = 0.5
        static let fontSizeScale = 0.4
    }
}

