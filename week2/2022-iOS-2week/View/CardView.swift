
import SwiftUI

struct CardView: View {
    @EnvironmentObject var gameManager: MemorizeGameManger
   
    let content: ImojiGame.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            switch content.isFaceUp {
            case .isFaceUp:
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 5)
                VStack {
                    Text(content.imoji)
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
            if content.isFaceUp != .isMatched {
                gameManager.tappedCard(content.id)
            }
        }
    }
}

