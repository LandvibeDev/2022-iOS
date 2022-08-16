//
//  MainView.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/15.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var calculator: CalculatorViewModel
    var body: some View {
        VStack {
            Spacer()
            result
//            Padview(symbols: calculator.symbol)
        }
    }
    
    var result: some View {
        Text("0").font(.largeTitle)
    }
    
//    var numberBoard: some View {
//
//    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let calculator = CalculatorViewModel()
        MainView(calculator: calculator)
    }
}
