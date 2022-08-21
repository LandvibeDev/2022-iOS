//
//  CaculatorManager.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import Foundation
import SwiftUI

class CalculatorManager: ObservableObject {
  
  private static func create() -> Caculator {
    return Caculator(operation: nil, showingText: 0, previousNumber: nil, nextNumber: nil, result: 0)
  }
  
  @Published private var calculateModel = create()
  
  var showingText: Double {
    calculateModel.showingText
  }
  
  // MARK: - Intentions
  
  func clickNumber(_ number: Double) {
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
