//
//  OperatorButton.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import SwiftUI

struct PadView: View {
    @EnvironmentObject var calculator: CalculatorManager
    
    var body: some View {
        VStack {
            ForEach(calculator.pad, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { button in
                        PadButton(button: button)
                    }
                }
            }
        }
    }
}

struct PadView_Previews: PreviewProvider {
    static var previews: some View {
        PadView()
            .environmentObject(CalculatorManager())
    }
}
