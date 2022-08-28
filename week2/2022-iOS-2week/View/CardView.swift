
import SwiftUI

struct CardView: View {
    @EnvironmentObject private var manager: MemorizeGameManger
   
    let card: EmojiGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            switch card.state {
            case .isFaceUp, .waitForMatched:
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 5)
                VStack {
                    Text(card.Emoji)
                        .font(.largeTitle)
                }
            case .isFaceDown:
                shape
                    .fill()
            case .isMatched:
                shape
                    .fill()
                    .foregroundColor(.white)
            }
        }
        .onTapGesture {
            manager.tappedCard(cardId: card.id)
        }
    }
}

