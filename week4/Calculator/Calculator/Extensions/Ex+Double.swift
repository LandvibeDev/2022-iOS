//
//  Ex+Double.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import Foundation

extension Double {
  
  var clean: String {
    return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
  }
}
