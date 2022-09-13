//
//  Array+Extension.swift
//  Memorize
//
//  Created by Byeongjo Koo on 2022/07/30.
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
