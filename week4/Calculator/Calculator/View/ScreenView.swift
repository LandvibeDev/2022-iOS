//
//  ScreenView.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/18.
//

import SwiftUI

struct ScreenView: View {
    @EnvironmentObject var calculatorManager: CalculatorManager
    var body: some View {
        HStack {
            Spacer()
            Text(calculatorManager.displayValue)
                .lineLimit(1)
                .foregroundColor(.white)
                .frame(height: 100, alignment: .bottomTrailing)
                .font(.title)
                .padding()
        }
    }
}

struct ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenView()
    }
}
