//
//  ButtonData.swift
//  Calculator
//
//  Created by changgyo seo on 2022/08/21.
//

import Foundation

struct ButtonData {
    static var sortedList: [CalculatorButton] = [
        .clear(.alldata), .sign, .percent, .divide(false),
        .numberOrDot("7"), .numberOrDot("8"), .numberOrDot("9"), .multiply(false),
        .numberOrDot("4"), .numberOrDot("5"), .numberOrDot("6"), .subtract(false),
        .numberOrDot("1"), .numberOrDot("2"), .numberOrDot("3"), .add(false),
        .numberOrDot("0"), .numberOrDot("."), .equal
    ]
}
