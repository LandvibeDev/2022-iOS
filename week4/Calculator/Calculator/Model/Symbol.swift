//
//  Symbol.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/16.
//

import Foundation

struct Symbol {
    
    // MARK: - Text
    
    enum Text: String {
        case allClear = "AC"
        case clear = "C"
        case toggleSign = "+/-"
        case percent = "%"
        case divide = "÷"
        case multiply = "×"
        case substract = "-"
        case addition = "+"
        case point = "."
        case equal = "="
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case zero = "0"
    }
}

extension Symbol {
    
    // MARK: - Color
    
    enum Color {
        case lightGray
        case darkGray
        case lightOrange
    }
}
