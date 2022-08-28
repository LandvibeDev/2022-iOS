//
//  Ex+String.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/26.
//

import Foundation

extension String {
  
  mutating func removeWithDecimal() {
    let removedDecimal = (Decimal(string: self) ?? 0) / 10
    let removedInteger = NSDecimalNumber(decimal: removedDecimal).intValue
    self = String(removedInteger)
  }
}
