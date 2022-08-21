//
//  ContentView.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var calculatorManager: CalculatorManager
  
  var body: some View {
    ZStack{
      Color.black.ignoresSafeArea()
      VStack {
        ResultView(showingText: calculatorManager.showingText)
        HStack {
          VStack {
            FunctionButtons(calculatorManager: calculatorManager)
            NumberPadView(calculatorManager: calculatorManager)
          }
          ArithmeticOperationButtons(calculatorManager: calculatorManager)
        }
      }
    }.foregroundColor(.white)
  }
}

struct ContentView_Previews: PreviewProvider {
  
  static var previews: some View {
    let caculatorManager = CalculatorManager()
    ContentView(calculatorManager: caculatorManager)
  }
}
