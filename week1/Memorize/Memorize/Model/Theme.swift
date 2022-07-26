//
//  Theme.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/07/26.
//

import SwiftUI

enum Theme {
    case animal 
    case emotion
    case fruit
    var emojis: [String] {
        switch self {
        case .emotion:
            return ["🥺", "🥸", "🤩", "😜", "🧐", "😤", "😛", "🥳", "🥶", "😓", "🫡", "🫥"]
        case .animal:
            return ["🐶", "🐱","🐭", "🐰", "🐻", "🐼", "🐨", "🦁", "🐮", "🐷"]
        case .fruit:
            return ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈"]
        }
    }
}

