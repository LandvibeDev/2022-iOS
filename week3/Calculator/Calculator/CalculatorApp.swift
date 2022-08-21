//
//  CalculatorApp.swift
//  Calculator
//
//  Created by changgyo seo on 2022/08/14.
//

import SwiftUI

@main
struct CalculatorApp: App {
    let calculator = Calculator()
    
    var body: some Scene {
        WindowGroup {
            CalculatorView().environmentObject(calculator)
        }
    }
}
