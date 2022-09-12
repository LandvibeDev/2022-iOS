//
//  Extension.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/25.
//

import Foundation

extension String {
    var decimalFormat: String {
        let numberFormatter = NumberFormatter();
        numberFormatter.numberStyle = .decimal
        let decimalFractionComponents = components(separatedBy: ".")
        guard let decimalString = decimalFractionComponents.first,
              let decimal = Int(decimalString),
              var decimalFormat = numberFormatter.string(from: NSNumber(value: decimal))
        else { return "오류"}
        if 1 < decimalFractionComponents.count, let fractionString = decimalFractionComponents.last {
            decimalFormat += ".\(fractionString)"
        }
        return decimalFormat
    }
}
