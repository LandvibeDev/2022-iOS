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
                .frame(height: 100)
            result
            Padview(calculator: calculator)
        }
    }
    var result: some View {
        VStack {
            HStack {
                Spacer()
                Text("\(calculator.result)")
                    .font(.largeTitle)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let calculator = CalculatorViewModel()
        MainView(calculator: calculator).preferredColorScheme(.dark)
    }
}
