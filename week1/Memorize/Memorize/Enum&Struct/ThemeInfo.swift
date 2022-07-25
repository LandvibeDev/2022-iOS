//
//  ThemeInfo.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import Foundation
import SwiftUI

enum ThemeInfo: Memorize {
    case country // default
    case emotion
    case food
    
    var maxCardNumber: Int {
        switch self {
        case .country:
            return 20
        case .emotion:
            return 24
        case .food:
            return 16
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
    
    var imageElements: [ImageAndText] {
        switch self{
        case .country:
            return [ImageAndText("🇰🇷", "대한민국"),ImageAndText("🇯🇵","일본"),ImageAndText("🇹🇷","튀르키예즈"),ImageAndText("🇱🇦","라오스"),ImageAndText("🇨🇦","캐나다"),ImageAndText("🇧🇫","부르키나 파소"),ImageAndText("🇧🇩","방글라데시"),ImageAndText("🇧🇪","독일"),ImageAndText("🇨🇮","코트디부아르"),ImageAndText("🇫🇮","핀란드")]
        case .emotion:
            return [ImageAndText("😀","행복해"),ImageAndText("😅","당황해"),ImageAndText("😝","메롱해"),ImageAndText("🫣","엄마야"),ImageAndText("🤥","으~ 냄새"),ImageAndText("😡","화가나"),ImageAndText("😵‍💫","정신 나가"),ImageAndText("😷","거리두기~"),ImageAndText("😴","졸려"),ImageAndText("🤫","쌰랍"),ImageAndText("😍","사랑해"),ImageAndText("🤪","우끼끼")]
        case .food:
            return [ImageAndText("🍩","도넛"),ImageAndText("🥞","팬 케이트"),ImageAndText("🥨","프레즐"),ImageAndText("🥝","키위"),ImageAndText("🍡","꼬치"),ImageAndText("🍺","비어루"),ImageAndText("🍱","초밥"),ImageAndText("🍛","카레")]
        }
    }
    
}
