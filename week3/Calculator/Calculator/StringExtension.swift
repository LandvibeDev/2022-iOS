//
//  StringExtension.swift
//  Calculator
//
//  Created by changgyo seo on 2022/08/21.
//

import Foundation

extension String {
    mutating func stringToDouble() -> Double {
        let sign: Double = self.contains("-") ? -1 : 1
        let removeDotResult = self.filter({ $0 != "-" && $0 != "," })
        
        return sign * (Double(removeDotResult) ?? 0)
    }
    
    mutating func appendWithDeciaml(_ newElement: String) {
        if newElement == "-" {
            if let signIndex = self.firstIndex(of: "-") {
                self.remove(at: signIndex)
            }
            else {
                self.insert("-", at: self.startIndex)
            }
        }
        
        if self.contains("-"), self.count >= 11  { return }
        else if self.count >= 10 { return }
        
        self.append(newElement)
        
        if newElement == "." { return }
        self = self.stringToDouble().doubleToStringWithDecimal()
    }
    
    mutating func removeWithDecimal() {
        let sign = self.first == "-" ? -1 : 1
        var number = Int(self.stringToDouble())
        number /= 10
        
        if sign == 1 {
            self = Double(number).doubleToStringWithDecimal()
        }
        else {
            self = Double(number).doubleToStringWithDecimal()
        }
    }
}
