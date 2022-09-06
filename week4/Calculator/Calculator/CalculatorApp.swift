//
//  CalculatorApp.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import SwiftUI

@main
struct CalculatorApp: App {
  
  let caculatorManager = CalculatorManager()
  
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(caculatorManager)
        }
    }
}
