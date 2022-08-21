//
//  ArithmeticOperationButtons.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import SwiftUI

struct ArithmeticOperationButtons: View {
  
  @ObservedObject var calculatorManager: CalculatorManager
  
  var body: some View {
    VStack {
      divideButton
      multiplyButton
      minusButton
      plusButton
      calculateButton
    }
  }
  
  var divideButton: some View {
    Button {
      calculatorManager.clickOperation(.divide)
    } label: {
      CircleButton(content: "/", color: .orange)
    }
  }
  
  var multiplyButton: some View {
    Button {
      calculatorManager.clickOperation(.multiply)
    } label: {
      CircleButton(content: "x", color: .orange)
    }
  }
  
  var minusButton: some View {
    Button {
      calculatorManager.clickOperation(.minus)
    } label: {
      CircleButton(content: "-", color: .orange)
    }
  }
  
  var plusButton: some View {
    Button {
      calculatorManager.clickOperation(.plus)
    } label: {
      CircleButton(content: "+", color: .orange)
    }
  }
  
  var calculateButton: some View {
    Button {
      calculatorManager.calculate()
    } label: {
      CircleButton(content: "=", color: .orange)
    }
  }
}
