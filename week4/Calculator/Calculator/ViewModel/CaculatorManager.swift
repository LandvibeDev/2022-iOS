//
//  CaculatorManager.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import SwiftUI

class CalculatorManager: ObservableObject {
  
  @Published private var calculateModel = create()
  
  var showingText: String {
    calculateModel.showingText
  }
  
  private static func create() -> Caculator {
    return Caculator(showingText: "0", result: 0)
  }
  
  // MARK: - Intentions
  
  func clickNumber(_ number: Decimal) {
    calculateModel.clickNumber(number)
  }
  
  func clickOperation(_ operation: Caculator.ArithmeticOperation?) {
    calculateModel.operation = operation
    calculateModel.state = .newNextNumber
  }
  
  func calculate() {
    calculateModel.calculate()
  }
  
  func clear() {
    calculateModel = CalculatorManager.create()
  }
  
  func changeSign() {
    calculateModel.changeSign()
  }
  
  func percent() {
    calculateModel.percent()
  }
  
  func addPoint() {
    calculateModel.addPoint()
  }
}
