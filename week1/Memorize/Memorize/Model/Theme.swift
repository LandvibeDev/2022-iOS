//
//  Theme.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/07/26.
//

import SwiftUI

enum Theme: Comparable{
    case animal 
    case emotion
    case fruit
    var emojis: [String] {
        switch self {
        case .emotion:
            return ["🥺", "🥸", "🤩", "😜", "🧐", "😤", "😛", "🥳", "🥶", "😓", "🫡", "🫥", "😝", "🤑", "😎", "🤓", "🤠",  "🤡", "😏", "😶", "😐", "🫤", "😑", "😒", "🙄", "🤨", "🤔", "🤫"]
        case .animal:
            return ["🐶", "🐱","🐭", "🐰", "🐻", "🐼", "🐨", "🦁", "🐮", "🐷", "🐥", "🦊", "🐵", "🦄", "🦓" ]
        case .fruit:
            return ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈"]
        }
    }
    var symbols: Image {
        switch self {
        case .animal:
            return Image(systemName: "pawprint.circle")
        case .emotion:
            return Image(systemName: "face.smiling")
        case .fruit:
            return Image(systemName: "applelogo")
            
        }
    }
    
    var maxNumber: Int {
        switch self {
        case .animal:
            return self.emojis.count
        case .emotion:
            return self.emojis.count
        case .fruit:
            return self.emojis.count
        }
    }
}

