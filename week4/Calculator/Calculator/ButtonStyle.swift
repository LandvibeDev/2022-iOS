//
//  ButtonStyle.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/18.
//
import SwiftUI

struct CalculateButtonStyle: ButtonStyle {
    var buttonColor: (Color, Color)
    var isZero: Bool

    func makeBody(configuration: Self.Configuration) -> some View {
        if isZero {
            configuration.label
                .frame(maxWidth:UIScreen.main.bounds.size.width / 2, maxHeight: UIScreen.main.bounds.size.height / 12, alignment: .leading)
                .font(.title)
                .padding()
                .background(buttonColor.0)
                .foregroundColor(buttonColor.1)
                .overlay {
                    if configuration.isPressed {
                        Color(white: 1.0, opacity: 0.3)
                    }
                }
                .clipShape(Capsule())
        } else {
            configuration.label
                .frame(maxWidth:UIScreen.main.bounds.size.width / 6.5, maxHeight: UIScreen.main.bounds.size.height / 12, alignment: .center)
                .font(.title)
                .padding()
                .background(buttonColor.0)
                .foregroundColor(buttonColor.1)
                .overlay {
                    if configuration.isPressed {
                        Color(white:  1.0, opacity: 0.3)
                    }
                }
                .clipShape(Circle())
        }
    }
}
