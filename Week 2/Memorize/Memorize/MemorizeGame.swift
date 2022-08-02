import Foundation

class MemorizeGame: ObservableObject {
    @Published var cardNumber = Theme.emotion.emojis.count
    @Published var currentTheme = Theme.emotion
    var themeEmojis = Theme.emotion.emojis
    var emojiList: [String] {
        var cardList: [String] = []
        for (index, emoji) in themeEmojis.enumerated() {
            if index < cardNumber {
                cardList.append(emoji)
            }
        }
        return cardList
    }
    
    func changeTheme(afterTheme: Theme) {
        currentTheme = afterTheme
        if cardNumber > currentTheme.maxNumber {
            cardNumber = currentTheme.maxNumber
        }
        themeEmojis = afterTheme.emojis
        themeEmojis.shuffle()
    }
  
}
