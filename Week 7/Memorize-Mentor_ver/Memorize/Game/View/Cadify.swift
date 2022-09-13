//
//  Cadify.swift
//  Memorize
//
//  Created by Byeongjo Koo on 2022/09/13.
//

import SwiftUI

/// Card + Modify
struct Cardify: Animatable, ViewModifier {
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    var rotation: Double
    var isFaceUp: Bool {
        rotation < 90
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
            } else {
                shape.fill()
            }
            content.opacity(isFaceUp ? 1 : 0)
        }
        .rotation3DEffect(Angle(degrees: rotation), axis: (0, 1, 0))
    }
}

// MARK: - View Extension for convenient use for Cardify

extension View {
    
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

// MARK: - Constant(s)

extension Cardify {
    
    private enum DrawingConstants {
        
        static let cornerRadius: CGFloat = 15
        static let lineWidth: CGFloat = 4
    }
}
