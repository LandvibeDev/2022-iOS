//
//  Calculator.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import Foundation

struct Caculator {
  
  var state: InputState = .newPreviousNumber
  var operation: ArithmeticOperation?
  private(set) var showingText: String
  private(set) var previousNumber: Decimal? {
    didSet {
      guard let previousNumber = previousNumber else { return }
      showingText = "\(previousNumber)"
    }
  }
  private(set) var nextNumber: Decimal? {
    didSet {
      guard let nextNumber = nextNumber else { return }
      showingText = "\(nextNumber)"
    }
  }
  private(set) var result: Decimal {
    didSet {
      showingText = "\(result)"
      previousNumber = result
    }
  }
  
  enum ArithmeticOperation {
    case multiply
    case divide
    case minus
    case plus
  }
  
  enum InputState {
    case newPreviousNumber
    case newNextNumber
    case ongoingPreviousNumber
    case ongoingNextNumber
  }
  
  mutating func clickNumber(_ number: Decimal) {
    switch state {
    case .newPreviousNumber:
      previousNumber = number
      state = .ongoingPreviousNumber
    case .newNextNumber:
      nextNumber = number
      state = .ongoingNextNumber
    case .ongoingPreviousNumber:
      previousNumber = joinNumbers(with: number)
    case .ongoingNextNumber:
      nextNumber = joinNumbers(with: number)
    }
  }
  
  mutating func calculate() {
    guard let priorNumber = previousNumber,
          let laterNumber = nextNumber,
          let operation = operation else { return }
    switch operation {
    case .multiply:
      result = priorNumber * laterNumber
    case .divide:
      result = priorNumber / laterNumber
    case .minus:
      result = priorNumber - laterNumber
    case .plus:
      result = priorNumber + laterNumber
    }
  }
  
  mutating func joinNumbers(with nextElement: Decimal) -> Decimal {
    let joinedString = showingText + "\(nextElement)"
    guard let joinedNumber = Decimal(string: joinedString) else { return 0 }
    return joinedNumber
  }
  
  mutating func changeSign() {
    if let priorNumber = previousNumber {
      previousNumber = -priorNumber
    }
  }
  
  mutating func percent() {
    guard let showingText = Decimal(string: showingText) else { return }
    result = showingText / 100
  }
  
  mutating func addPoint() {
    if !showingText.contains(".") {
      showingText = showingText + "."
      if showingText.compare("0") == .orderedSame {
        state = .ongoingPreviousNumber
      }
    }
  }
}
