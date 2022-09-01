//
//  String+Extension.swift
//  ApiTest
//
//  Created by 임주민 on 2022/09/01.
//

import Foundation

extension String {
  
  var insertComma: String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    guard let doubleValue = Double(self),
          let insertedCommaValue = numberFormatter.string(from: NSNumber(value: doubleValue))
    else { return self }
    return insertedCommaValue
  }
}
