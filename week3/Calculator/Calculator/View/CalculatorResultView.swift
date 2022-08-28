//
//  CalculatorResultView.swift
//  Calculator
//
//  Created by changgyo seo on 2022/08/17.
//

import SwiftUI

struct CalculatorResultView: View {
    @EnvironmentObject private var calculator: Calculator
    
    var body: some View {
        LazyVStack(alignment: .trailing) {
            Text(calculator.displayResult)
                .font(.system(size: DrawConstans.fontSize))
                .minimumScaleFactor(DrawConstans.fontMinimumSacleFactor)
                .lineLimit(1)
        }
        .padding(DrawConstans.textPadding)
        .gesture(
            DragGesture()
                .onEnded { _ in calculator.slideToRemove() }
        )
    }
}

extension CalculatorResultView {
    private enum DrawConstans {
        static let fontSize = 80.0
        static let fontMinimumSacleFactor = 0.5
        static let textPadding = 20.0
    }
}

struct CalculatorResultView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorResultView()
    }
}
