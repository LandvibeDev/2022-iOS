//
//  Calculator.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import Foundation

struct Caculator {

  var operation: arithmeticOperation?
  var state: inputState = .newPreviousNumber
  private(set) var showingText: Double 
  private(set) var previousNumber: Double? { didSet { showingText = previousNumber ?? 0 } }
  private(set) var nextNumber: Double? { didSet { showingText = nextNumber ?? 0 } }
  private(set) var result: Double { didSet { showingText = result } }
  
  mutating func enterNumber(_ number: Double) {
    switch state {
    case .newPreviousNumber:
      previousNumber = number
      state = .ongoingPreviousNumber
    case .newNextNumber:
      nextNumber = number
      state = .ongoingNextNumber
    case .ongoingPreviousNumber, .ongoingNextNumber:
      joinNumbers(nextElement: number)
    }
  }
  
  mutating func caculate() {
    guard let priorNum = previousNumber else { return }
    guard let laterNum = nextNumber else { return }
    guard let operation = operation else { return }
    
    switch operation {
    case .multiply:
      result = priorNum * laterNum
    case .divide:
      result = priorNum / laterNum
    case .minus:
      result = priorNum - laterNum
    case .plus:
      result = priorNum + laterNum
    }
  }
  
  mutating func joinNumbers(nextElement: Double) {
    if let previousElement = previousNumber {
      if let previousElement = nextNumber {
        let joinedNumber = String(previousElement) + String(nextElement)
        nextNumber = Double(joinedNumber)
      }
      let joinedNumber = String(previousElement) + String(nextElement)
      previousNumber = Double(joinedNumber)
    }
  }
  
  mutating func changeSign() {
    showingText = -showingText
  }
  
  mutating func percent() {
    result = showingText / 100
  }
  
  func addPoint() { }
}

enum arithmeticOperation {
  case multiply, divide, minus, plus
}

enum inputState {
  case newPreviousNumber
  case newNextNumber
  case ongoingPreviousNumber
  case ongoingNextNumber
}
