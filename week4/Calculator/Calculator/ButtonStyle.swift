//
//  ButtonStyle.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/18.
//
import SwiftUI

struct CalculateButtonStyle: ButtonStyle {
    var backgroundColor: Color
    var foregroundColor: Color
    var isZero: Bool
    @ViewBuilder
    func makeBody(configuration: Self.Configuration) -> some View {
        if isZero {
            configuration.label
                .frame(maxWidth:UIScreen.main.bounds.size.width / 2, maxHeight: UIScreen.main.bounds.size.height / 12, alignment: .leading)
                .font(.title2)
                .padding()
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .overlay {
                    if configuration.isPressed {
                        Color(white:  1.0, opacity: 0.3)
                    }
                }
                .clipShape(Capsule())
        } else {
            configuration.label
                .frame(maxWidth:UIScreen.main.bounds.size.width / 6, maxHeight: UIScreen.main.bounds.size.height / 12, alignment: .center)
                .font(.title2)
                .padding()
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .overlay {
                    if configuration.isPressed {
                        Color(white:  1.0, opacity: 0.3)
                    }
                }
                .clipShape(Circle())
        }
    }
}
