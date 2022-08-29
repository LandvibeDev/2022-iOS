//
//  Numeric+Extension.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/25.
//

import Foundation

extension Numeric {
    var exponentialNotation: String {
        guard let exponentialNotationString = Formatter.exponentialNotation.string(for: self) else {
            return "오류"
        }
        return exponentialNotationString
    }
}
