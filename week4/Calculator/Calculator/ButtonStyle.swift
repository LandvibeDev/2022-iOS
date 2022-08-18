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
    func makeBody(configuration: Self.Configuration) -> some View {
        if isZero {
            return configuration.label
                .frame(width: 100, height: 30, alignment: .leading)
                .padding()
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .overlay {
                    if configuration.isPressed {
                        Color(white:  1.0, opacity: 0.2)
                    }
                }
                .clipShape(Capsule())
        } else {
            return configuration.label
                .frame(width: 30, height: 30, alignment: .center)
                .padding()
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .overlay {
                    if configuration.isPressed {
                        Color(white:  1.0, opacity: 0.2)
                    }
                }
                .clipShape(Capsule())
        }
    }
}
