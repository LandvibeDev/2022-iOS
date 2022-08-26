//
//  ButtonView.swift
//  Calculator
//
//  Created by changgyo seo on 2022/08/26.
//

import SwiftUI

struct ButtonView: View {
    
    var buttonData: Calculator.ArithmeticOperation
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius(in: geometry.size))
                    .foregroundColor(Color(.sRGB,
                                           red: buttonData.backgroundColor.red,
                                           green: buttonData.backgroundColor.green,
                                           blue: buttonData.backgroundColor.blue,
                                           opacity: buttonData.backgroundColor.opacity))
                
                Text(buttonData.content)
                    .foregroundColor(Color(.sRGB,
                                           red: buttonData.textColorColor.red,
                                           green: buttonData.textColorColor.green,
                                           blue: buttonData.textColorColor.blue,
                                           opacity: buttonData.textColorColor.opacity))
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

extension ButtonView {
    private enum DrawConstans {
        static let buttonCornerRadius = 0.5
        static let fontSizeScale = 0.4
    }
}
