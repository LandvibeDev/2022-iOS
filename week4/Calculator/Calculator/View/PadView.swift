//
//  OperatorButton.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import SwiftUI

struct PadView: View {
    @EnvironmentObject var calculatorManager: CalculatorManager
    
    var body: some View {
        VStack {
            ForEach(calculatorManager.pad, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { button in
                        EachButton(button: button)
                    }
                }
            }
        }
    }
}

struct PadView_Previews: PreviewProvider {
    static var previews: some View {
        PadView()
    }
}
