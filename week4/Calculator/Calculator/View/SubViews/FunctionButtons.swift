//
//  FunctionButtons.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import SwiftUI

struct FunctionButtons: View {
  
  @ObservedObject var calculatorManager: CalculatorManager
  
  var body: some View {
    HStack {
      clearButton
      changeSign
      percentButton
    }
  }
  
  var clearButton: some View {
    Button {
      calculatorManager.clear()
    } label: {
      CircleButton(content: "C", color: .green)
    }
  }
  
  var changeSign: some View {
    Button {
      calculatorManager.changeSign()
    } label: {
      CircleButton(content: "+/-", color: .green)
    }
  }
  
  var percentButton: some View {
    Button {
      calculatorManager.percent()
    } label: {
      CircleButton(content: "%", color: .green)
    }
  }
}
