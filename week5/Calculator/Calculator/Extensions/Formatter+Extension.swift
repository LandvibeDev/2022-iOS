//
//  Formatter+Extension.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/25.
//

import Foundation

extension Formatter {
    static let scientific: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.positiveFormat = "0.###E+0"
        formatter.exponentSymbol = "e"
        return formatter
    }()
}
