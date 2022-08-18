//
//  PadView.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/15.
//

import SwiftUI

struct Padview: View {
    let calculator: CalculatorViewModel
    var body: some View {
        VStack {
            HStack {
                ButtonView(calculator: calculator, text: .allClear)
                ButtonView(calculator: calculator, text: .toggleSign)
                ButtonView(calculator: calculator, text: .percent)
                ButtonView(calculator: calculator, text: .divide)
            }
            HStack {
                ButtonView(calculator: calculator, text: .seven)
                ButtonView(calculator: calculator, text: .eight)
                ButtonView(calculator: calculator, text: .nine)
                ButtonView(calculator: calculator, text: .multiply)
            }
            HStack {
                ButtonView(calculator: calculator, text: .four)
                ButtonView(calculator: calculator, text: .five)
                ButtonView(calculator: calculator, text: .six)
                ButtonView(calculator: calculator, text: .substract)
            }
            HStack {
                ButtonView(calculator: calculator, text: .one)
                ButtonView(calculator: calculator, text: .two)
                ButtonView(calculator: calculator, text: .three)
                ButtonView(calculator: calculator, text: .addition)
            }
            HStack {
                ButtonView(calculator: calculator, text: .zero).frame(width: 210, height: 100)
                ButtonView(calculator: calculator, text: .point)
                ButtonView(calculator: calculator, text: .equal)
            }
        }
    }
    
    init(calculator: CalculatorViewModel) {
        self.calculator = calculator
    }
}

struct NumberListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CalculatorViewModel()
        Padview(calculator: viewModel)
    }
}
