//
//  Extensions.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/10/11.
//

import Foundation

extension Array {
    
    var oneAndOnly: Element? {
        count == 1 ? first : nil
    }
}

extension Array where Element: Identifiable {
    
    func index(matching element: Element) -> Index? {
        firstIndex(where: { $0.id == element.id })
    }
}
