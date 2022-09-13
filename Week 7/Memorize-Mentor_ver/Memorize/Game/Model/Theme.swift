//
//  Theme.swift
//  Memorize
//
//  Created by Byeongjo Koo on 2022/07/31.
//

import Foundation

struct Theme {
    
    let name: Name
    let emojiList: [String]
    let color: Color
    let numberOfPairsOfCardsToShow: Int
    
    // MARK: Initializer(s)
    
    init() {
        name = Name.allCases.randomElement() ?? .vehicle
        var emojiList: [String]
        switch name {
        case .vehicle:
            emojiList = Emoji.vehicleList
            color = .red
            numberOfPairsOfCardsToShow = 4
        case .halloween:
            emojiList = Emoji.halloweenList
            color = .orange
            numberOfPairsOfCardsToShow = 6
        case .animal:
            emojiList = Emoji.animalList
            color = .yellow
            numberOfPairsOfCardsToShow = 8
        case .nature:
            emojiList = Emoji.natureList
            color = .green
            numberOfPairsOfCardsToShow = 10
        case .sports:
            emojiList = Emoji.sportsList
            color = .blue
            numberOfPairsOfCardsToShow = 12
        case .flag:
            emojiList = Emoji.flagList
            color = .indigo
            numberOfPairsOfCardsToShow = 14
        case .face:
            emojiList = Emoji.faceList
            color = .purple
            numberOfPairsOfCardsToShow = 16
        }
        self.emojiList = emojiList.shuffled()
    }
}

// MARK: - Name

extension Theme {
    
    enum Name: String, CaseIterable {
        
        case vehicle
        case halloween
        case animal
        case nature
        case sports
        case flag
        case face
    }
}

// MARK: - Emoji

extension Theme {
    
    private enum Emoji {
        
        static let vehicleList = [
            "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑",
            "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛵", "🏍",
            "🛺", "✈️",
        ]
        static let halloweenList = [
            "😈", "👹", "👺", "🤡", "👻", "💀", "☠️", "👽",
            "👾", "🎃",
        ]
        static let animalList = [
            "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼",
            "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐽", "🐸",
            "🐵", "🐔", "🐧", "🐦", "🐤", "🐣", "🐥", "🦆",
        ]
        static let natureList = [
            "🌵", "🌲", "🌳", "🌴", "🪵", "🌱", "🌿", "☘️",
            "🍀", "🎍", "🪴", "🎋", "🍃", "🍂", "🍁", "🪺",
            "🪹", "🍄", "🪸", "🪨",
        ]
        static let sportsList = [
            "⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉",
        ]
        static let flagList = [
            "🏳️", "🏴", "🏴‍☠️", "🏁", "🇰🇷", "🇬🇧", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇺🇸",
            "🇪🇸", "🇯🇵", "🇧🇷", "🇦🇷", "🇪🇬", "🇪🇺", "🇩🇪", "🇮🇪",
        ]
        static let faceList = [
            "😃", "😁", "😆", "🥹", "😅", "😂", "🤣", "🥲",
            "☺️", "😍", "🥰", "😝", "🤪", "😎", "🥳", "🥺",
            "😭", "🤯", "🤬", "🥶", "😶‍🌫️", "😱", "🫡", "🫥",
            "🫠", "🫣", "🥱", "🤢", "🤠", "🤧"
        ]
    }
}

// MARK: - Color

extension Theme {
    
    enum Color {
        
        case red
        case orange
        case yellow
        case green
        case blue
        case indigo
        case purple
    }
}
