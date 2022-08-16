//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/16.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    let symbols: [[Symbol.Text]]
    
    
    init() {
//        expression = ""
        symbols = [[.addition, .toggleSign, .remainder, .divide] ,
                  [.seven, .eight, .nine, .mutiply],
                  [.four, .five, .six, .substract],
                  [.one, .two, .three, .addition],
                  [.zero, .point, .equal]]
    }
    
    func click(symbol: String) -> Void {
        
    }
}

