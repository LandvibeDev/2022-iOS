//
//  Numeric+Extension.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/25.
//

import Foundation

extension Numeric {
    var exponentialNotation: String {
        return Formatter.exponentialNotation.string(for: self) ?? ""
    }
}
