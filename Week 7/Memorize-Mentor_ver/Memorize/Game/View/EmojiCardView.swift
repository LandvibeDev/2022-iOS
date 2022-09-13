//
//  EmojiCardView.swift
//  Memorize
//
//  Created by Byeongjo Koo on 2022/08/15.
//

import SwiftUI

struct EmojiCardView: View {
    
    let card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            Text(card.content)
                .rotationEffect(Angle(degrees: card.isMatched ? AnimationConstants.emojiRotationAngle : 0))
                .animation(matchedRotateAnimation, value: card.isMatched)
                .font(font(in: geometry.size))
                .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    // MARK: Animation
    
    private var matchedRotateAnimation: Animation {
        Animation
            .linear(duration: AnimationConstants.matchedRotateDuration)
            .repeatCount(AnimationConstants.matchedRotateCount, autoreverses: false)
    }
    
    // MARK: Configuration
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
}

// MARK: - Constant(s)

extension EmojiCardView {
    
    private enum DrawingConstants {
    
        static let fontScale: CGFloat = 0.75
    }
    
    private enum AnimationConstants {
        
        static let emojiRotationAngle = 360.0
        static let matchedRotateDuration = 1.0
        static let matchedRotateCount = 2
    }
}
