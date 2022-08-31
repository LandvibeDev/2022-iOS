//
//  ContentView.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject var calculatorManager: CalculatorManager

    var body: some View {
        VStack {
            Spacer()
            ScreenView()
            PadView()
        }
        .background(.black)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .environmentObject(CalculatorManager())
    }
}
