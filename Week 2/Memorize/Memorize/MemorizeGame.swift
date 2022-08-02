import Foundation

class MemorizeGame: ObservableObject {
    @Published var cardNumber = Theme.emotion.emojis.count
    @Published var currentTheme = Theme.emotion
    var themeEmojis: [String] = Theme.emotion.emojis
    func changeTheme(afterTheme: Theme) {
        currentTheme = afterTheme
        if cardNumber > currentTheme.maxNumber {
            cardNumber = currentTheme.maxNumber
        }
        themeEmojis = afterTheme.emojis
        themeEmojis.shuffle()
    }
    func emojiList() -> [String] {
        var cardList: [String] = []
        for (index, emoji) in themeEmojis.enumerated() {
            if index < cardNumber {
                cardList.append(emoji)
            }
        }
        return cardList
    }
}
