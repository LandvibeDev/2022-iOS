//
//  ContentView.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import SwiftUI

struct CalculatorView: View {
    var body: some View {
        VStack {
            Spacer()
            ScreenView()
                .border(.white)
            PadView()
                .border(.blue)
        }
        .background(Color.black)
        .border(Color.red)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
