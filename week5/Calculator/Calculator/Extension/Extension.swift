//
//  Extension.swift
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

extension Numeric {
    var exponentialNotation: String {
        return Formatter.scientific.string(for: self) ?? ""
    }
}

// MARK: insertComma

extension String {
    var insertComma: String {
        let numberFormatter = NumberFormatter();
        numberFormatter.numberStyle = .decimal
        if self.contains(".") {
            let numberArray = self.components(separatedBy: ".")
            let numberString = numberArray.first ?? "0"
            guard let doubleValue = Double(numberString) else {
                return self
            }
            return (numberFormatter.string(from: NSNumber(value: doubleValue)) ?? numberString) + ".\(numberArray[numberArray.index(numberArray.startIndex, offsetBy: 1)])"
        } else {
            guard let doubleValue = Double(self) else {
                return self
            }
            return numberFormatter.string(from: NSNumber(value: doubleValue)) ?? self
        }
    }
}
