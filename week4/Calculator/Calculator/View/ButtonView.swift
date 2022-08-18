//
//  ButtonView.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/15.
//

import SwiftUI

struct ButtonView: View {
    let calculator: CalculatorViewModel
    let text: Symbol.Text
    var body: some View {
        Button {
            calculator.click(inputText: text.rawValue)
        } label: {
            GeometryReader { geometry in
                ZStack {
                    if text == .zero {
                        RoundedRectangle(cornerRadius: 100)
                            .fill(Color.darkGray)
                    } else if text == .allClear || text == .toggleSign || text == .percent {
                        Circle()
                            .fill(Color.lightGray)
                    } else if text == .divide || text == .multiply || text == .substract || text == .addition || text == .equal {
                        Circle()
                            .fill(Color.lightOrange)
                    }else {
                        Circle()
                            .fill(Color.darkGray)
                    }
                    Text("\(text.rawValue)")
                        .font(font(in: geometry.size))
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawConstants.fontScale)
    }
}

extension ButtonView {
    private enum DrawConstants {
        static let fontScale: CGFloat = 0.5
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(calculator: CalculatorViewModel() ,text: Symbol.Text.zero).preferredColorScheme(.dark)
    }
}
