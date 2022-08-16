//
//  PadView.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/15.
//

import SwiftUI

struct Padview: View {
    
    let symbols: [[Symbol.Text]]
    var body: some View {
        //이거 for문으로 바꿔서 구현하기.(그러려고 symbols로 변수 받아온 것)
        VStack {
            HStack {
                ButtonView(symbols: .allClear)
                ButtonView(symbols: .toggleSign)
                ButtonView(symbols: .remainder)
                ButtonView(symbols: .divide)
            }
            HStack {
                ButtonView(symbols: .seven)
                ButtonView(symbols: .eight)
                ButtonView(symbols: .nine)
                ButtonView(symbols: .mutiply)
            }
            HStack {
                ButtonView(symbols: .four)
                ButtonView(symbols: .five)
                ButtonView(symbols: .six)
                ButtonView(symbols: .substract)
            }
            HStack {
                ButtonView(symbols: .one)
                ButtonView(symbols: .two)
                ButtonView(symbols: .three)
                ButtonView(symbols: .addition)
            }
            HStack {
                ButtonView(symbols: .zero)
                ButtonView(symbols: .zero)
                ButtonView(symbols: .point)
                ButtonView(symbols: .equal)
            }
            
        }
    }
    init(symbols: [[Symbol.Text]]) {
        self.symbols = symbols
    }
}

struct NumberListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CalculatorViewModel()
        Padview(symbols: viewModel.symbols)
    }
}
