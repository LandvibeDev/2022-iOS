//
//  CalculatorApp.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import SwiftUI

@main
struct CalculatorApp: App {
    private let calculatorManager = CalculatorManager()
    
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(calculatorManager)
        }
    }
}
