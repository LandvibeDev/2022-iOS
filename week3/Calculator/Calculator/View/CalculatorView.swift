//
//  ContentView.swift
//  Calculator
//
//  Created by changgyo seo on 2022/08/14.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject private var calculator: Calculator
    
    var body: some View {
        VStack {
            Spacer()
            CalculatorResultView()
            VGridWithUIScreenWidth(items: calculator.buttonList,
                                   columnsCount: DrawConstans.veticalModlColumnsCount) { item in
                ButtonView(buttonData: item)
            }
        }
    }
}

extension CalculatorView {
    enum DrawConstans {
        static let veticalModlColumnsCount = 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
