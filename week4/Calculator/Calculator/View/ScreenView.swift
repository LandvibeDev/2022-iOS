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
        Text(calculatorManager.displayValue)
            .frame(width: 300, height: 200, alignment: .trailing)
            .font(.title)
    }
}

struct ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenView()
    }
}
