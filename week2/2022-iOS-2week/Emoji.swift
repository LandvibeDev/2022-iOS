//
//  ConstantEmoji.swift
//  2022-iOS-2week
//
//  Created by changgyo seo on 2022/08/13.
//

import Foundation

struct Emoji {
    static let face = ["😀","😍","🤪","🤑","😔","😰","🤯","🤕","🤐","🤩","🤡","🤠","😶","👿","😶‍🌫️","🥶"]
    static let animal = ["🐶","🐭","🐻","🐯","🐨","🐸","🦧","🦊","🦍","🐷","🦁","🦥","🦒"]
    static let sports = ["🏉","🏈","⚽","🏀","⚾","🥎","🎾","🏐","🎱","🥏","🏓","🥅","🪃","🏒","🥍","🥊"]
    static let heart = ["🧡","💔","💙","💜","💛","💚","🤎","🤍","🖤","❤️‍🔥","💝","💗"]
    static let vehicle = ["🚗","🚑","🚙","🚓","🚒","🚕","🛺","🚐","🚌","🛻","🚎","🚚","🏎","🚛","🏍","🛵","🚁"]
    static let outfit = ["👚","🥼","🦺","🧥","👙","🩱","👞","🥿","🥾","🧢","👡","👠","🧦","👘","👗","🧤","🧣","👓"]
    
    static func emit(willChangeTheme theme: Theme.Kind) -> [String] {
        switch theme {
        case .face:
            return face
        case .animal:
            return animal
        case .sports:
            return sports
        case .vehicle:
            return vehicle
        case .heart:
            return heart
        case .outfit:
            return outfit
        }
    }
}
