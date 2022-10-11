import SwiftUI

struct CardView: View {
    @EnvironmentObject var memorizeGameDealer: MemorizeGameDealer
    let card: MemorizeGame<String>.Card
    
    var body: some View {
        Text(card.content)
            .font(.largeTitle)
            .rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
            .animation(matchedRotateAnimation, value: card.isMatched)
            .cardify(isFaceUp: card.isFaceUp, isMatched: card.isMatched)
    }
    
    private var matchedRotateAnimation: Animation {
        Animation
            .linear(duration: AnimationConstants.matchedRotateDuration)
            .repeatCount(AnimationConstants.matchedRotateCount, autoreverses: true)
    }
}

extension CardView {
    private enum AnimationConstants {
        static let matchedRotateDuration = 5.0
        static let matchedRotateCount = 5
    }
}
