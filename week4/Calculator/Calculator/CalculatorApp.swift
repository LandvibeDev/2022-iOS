//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/15.
//

import SwiftUI

@main
struct CalculatorApp: App {
    
    private let calculator = CalculatorViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView(calculator: calculator)
        }
    }
}
