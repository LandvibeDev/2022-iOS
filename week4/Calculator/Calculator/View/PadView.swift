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
                ButtonView(text: .allClear)
                ButtonView(text: .toggleSign)
                ButtonView(text: .remainder)
                ButtonView(text: .divide)
            }
            HStack {
                ButtonView(text: .seven)
                ButtonView(text: .eight)
                ButtonView(text: .nine)
                ButtonView(text: .mutiply)
            }
            HStack {
                ButtonView(text: .four)
                ButtonView(text: .five)
                ButtonView(text: .six)
                ButtonView(text: .substract)
            }
            HStack {
                ButtonView(text: .one)
                ButtonView(text: .two)
                ButtonView(text: .three)
                ButtonView(text: .addition)
            }
            HStack {
                ButtonView(text: .zero).frame(height: 100)
                ButtonView(text: .zero).frame(height: 100)
                ButtonView(text: .point)
                ButtonView(text: .equal)
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
