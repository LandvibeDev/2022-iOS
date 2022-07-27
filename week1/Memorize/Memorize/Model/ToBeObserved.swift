//
//  ToBeObserved.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/07/27.
//

import Foundation
import SwiftUI

class ToBeObserved : ObservableObject {
    @Published var cardNumber = Theme.emotion.emojis.count
    @Published var currentTheme = Theme.emotion
    
    var themeEmojis : [String] = Theme.emotion.emojis
    
    func changeTheme(newTheme: Theme){
        currentTheme = newTheme
        if cardNumber > currentTheme.maxNumber {
            cardNumber = currentTheme.maxNumber
        }
        themeEmojis = newTheme.emojis
        themeEmojis.shuffle()
    }
    
    func returnCardList() -> [String]
    {
        var cardList: [String] = []
        for (idx, emoji) in themeEmojis.enumerated() {
            if idx < cardNumber {
                cardList.append(emoji)
            }
        }
        return cardList
    }
    
}
