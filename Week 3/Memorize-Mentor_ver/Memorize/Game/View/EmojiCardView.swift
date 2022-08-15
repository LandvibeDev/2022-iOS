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
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    // MARK: Configuration
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawConstants.fontScale)
    }
}

// MARK: - Constant(s)

extension EmojiCardView {
    
    private enum DrawConstants {
        
        static let cornerRadius: CGFloat = 15
        static let lineWidth: CGFloat = 4
        static let fontScale: CGFloat = 0.75
    }
}

//struct EmojiCardView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        EmojiCardView()
//    }
//}
