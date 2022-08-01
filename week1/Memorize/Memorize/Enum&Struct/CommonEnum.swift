
import SwiftUI

enum ThemeInfo: Identifiable{
    
    case country(maxCardCount: Int = 20) // default case
    case emotion(maxCardCount: Int = 24)
    case food(maxCardCount: Int = 16)
    
    static var allCases = [country(), emotion(), food()]
    
    var id: String {
        switch self {
        case .country:
            return "1"
        case .emotion:
            return "2"
        case .food:
            return "3"
        }
    }
    
    var themeName: String {
        switch self {
        case .country:
            return "Country"
        case .emotion:
            return "Emotion"
        case .food:
            return "Food"
        }
    }
    
    var themeRepresentativeImageName: String {
        switch self {
        case .country:
            return "globe.asia.australia"
        case .emotion:
            return "face.dashed"
        case .food:
            return "fork.knife.circle"
        }
    }
    
    var maxCardCount: Int {
        switch self {
        case .country(let maxCardCount):
            return maxCardCount
        case .emotion(let maxCardCount):
            return maxCardCount
        case .food(let maxCardCount):
            return maxCardCount
        }
    }
    
    var themeColor: Color {
        switch self {
        case .country:
            return .blue
        case .emotion:
            return .yellow
        case .food:
            return .green
        }
    }
    
    var imageList: [CardInfo] {
        switch self {
        case .country:
            return [CardInfo("🇰🇷", "대한민국"),
                    CardInfo("🇯🇵","일본"),
                    CardInfo("🇹🇷","튀르키예즈"),
                    CardInfo("🇱🇦","라오스"),
                    CardInfo("🇨🇦","캐나다"),
                    CardInfo("🇧🇫","부르키나 파소"),
                    CardInfo("🇧🇩","방글라데시"),
                    CardInfo("🇧🇪","독일"),
                    CardInfo("🇨🇮","코트디부아르"),
                    CardInfo("🇫🇮","핀란드")]
        case .emotion:
            return [CardInfo("😀","행복해"),
                    CardInfo("😅","당황해"),
                    CardInfo("😝","메롱해"),
                    CardInfo("🫣","엄마야"),
                    CardInfo("🤥","으~ 냄새"),
                    CardInfo("😡","화가나"),
                    CardInfo("😵‍💫","정신 나가"),
                    CardInfo("😷","거리두기~"),
                    CardInfo("😴","졸려"),
                    CardInfo("🤫","쌰랍"),
                    CardInfo("😍","사랑해"),
                    CardInfo("🤪","우끼끼")]
        case .food:
            return [CardInfo("🍩","도넛"),
                    CardInfo("🥞","팬 케이트"),
                    CardInfo("🥨","프레즐"),
                    CardInfo("🥝","키위"),
                    CardInfo("🍡","꼬치"),
                    CardInfo("🍺","비어루"),
                    CardInfo("🍱","초밥"),
                    CardInfo("🍛","카레")]
        }
    }
    
    var doubleImageList: [CardInfo] {
        imageList + imageList.map { CardInfo($0.image, $0.text, "1") }
    }
}

enum ModeForPlusMinusButton: Int {
    
    case plus = 1
    case minus = -1
    
    var modeImage: String {
        switch self {
        case .plus:
            return "plus.app"
        case .minus:
            return "minus.square"
        }
    }
}

enum cardIsFaceUp {
    
    case isFaceUp
    case isFaceDown
    
    mutating func toggle() {
        switch self {
        case .isFaceUp:
            self = .isFaceDown
        case .isFaceDown:
            self = .isFaceUp
        }
    }
}
