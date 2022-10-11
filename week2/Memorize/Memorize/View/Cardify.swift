//
//  Cardify.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/09/28.

import SwiftUI

struct Cardify: ViewModifier, Animatable {
    @EnvironmentObject var memorizeGameDealer: MemorizeGameDealer
    var isMatched: Bool
    var rotation: Double
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    init(isFaceUp: Bool, isMatched: Bool) {
        rotation = isFaceUp ? 0 : 180
        self.isMatched = isMatched
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if rotation < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 5)
            } else if isMatched{
                shape.fill(.white)
            } else {
                shape.fill().foregroundColor(memorizeGameDealer.themeColor)
            }
            content.opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(Angle(degrees: rotation), axis: (0, 1, 0))
        
    }
}

extension View {
    
    func cardify(isFaceUp: Bool, isMatched: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, isMatched: isMatched))
    }
    
}

