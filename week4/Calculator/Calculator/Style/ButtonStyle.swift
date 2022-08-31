//
//  ButtonStyle.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/18.
//
import SwiftUI

struct CalculateButtonStyle: ButtonStyle {
    let buttonColor: (background: Color, foreground: Color)
    let isZero: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(
                maxWidth:UIScreen.main.bounds.size.width / (isZero ? 2.0 : 6.5),
                maxHeight: UIScreen.main.bounds.size.height / 12,
                alignment: isZero ? .leading : .center)
            .font(.title)
            .padding()
            .background(buttonColor.background)
            .foregroundColor(buttonColor.foreground)
            .overlay {
                if configuration.isPressed {
                    Color(white: 1.0, opacity: 0.3)
                }
            }
            .clipShape(Capsule())
    }
}
