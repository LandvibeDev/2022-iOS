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
  
  var text: Double {
    calculateModel.showingText
  }
  
  var priorNum: Double? {
    calculateModel.previousNumber
  }
  
  var laterNum: Double? {
    calculateModel.nextNumber
  }
  
  var result: Double {
    calculateModel.result
  }
  
  // MARK: - Intentions
  
  func enterNumber(_ number: Double) {
    calculateModel.enterNumber(number)
  }
  
  func clickOperation(_ operation: arithmeticOperation) {
    calculateModel.operation = operation
    calculateModel.state = .newNextNumber
  }
  
  func calculate() {
    calculateModel.caculate()
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
