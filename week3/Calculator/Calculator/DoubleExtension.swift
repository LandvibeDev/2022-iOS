//
//  DoubleExtension.swift
//  Calculator
//
//  Created by changgyo seo on 2022/08/21.
//

import Foundation

extension Double {
    func doubleToStringWithDecimal() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: self)) ?? "오류"
    }
}
