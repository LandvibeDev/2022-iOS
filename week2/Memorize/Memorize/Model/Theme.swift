//
//  Theme.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/07.
//

import Foundation

enum Theme: String, CaseIterable {
    case halloween = "Halloween"
    case sports = "Sports"
    case nature = "Nature"
    case animal = "Animal"
    case vehicle = "Vehicle"
    case face = "Face"
    case flag = "Flag"
    
    enum Color {
        case orange
        case blue
        case green
        case yellow
        case red
        case purple
        case cyan
        case black
    }
    
    var Emojis: [String] {
        switch self {
        case .halloween:
            return ["🎃", "💀", "👻", "☠️", "🤡", "👹", "👺"]
        case .sports:
            return ["🥎", "🏀", "🏈", "⚽️", "⚾️", "🏐"]
        case .nature:
            return ["🌲", "🌳", "🌱", "🌴", "🌵", "🍁", "🌿", "🍂"]
        case .animal:
            return ["🙊", "🦔", "🐨", "🐋", "🐕", "🦈"]
        case .vehicle:
            return ["🚗", "🚑", "🚝", "🚒", "🚎", "🚁"]
        case .face:
            return ["👸", "🎅", "👴", "👦"]
        case .flag:
            return ["🇰🇷", "🇺🇸", "🇯🇵", "🇨🇳", "🇨🇦", "🇧🇪", "🇬🇪", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇬🇧", "🇧🇷"]
        }
    }

    var randomNumberOfCardPair: Int {
        let randomNumber = 2 * Int.random(in: 1...5)
        
        let test1 = print("randomNumber : \(randomNumber)")
        let test2 = print("self.Emojis.count : \(self.Emojis.count)")
        
        if randomNumber > self.Emojis.count {
            return self.Emojis.count
        } else {
            return randomNumber
        }
    }
}








