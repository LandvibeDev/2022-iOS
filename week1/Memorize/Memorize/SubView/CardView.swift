
import SwiftUI

struct CardView: View {
    
    let content: CardInfo
    
    @State private var cardIsFaceUp: cardIsFaceUp = .isFaceUp
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            switch cardIsFaceUp {
            case .isFaceUp:
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 5)
                VStack {
                    Text(content.image)
                        .font(.largeTitle)
                    Text(content.text)
                }
            case .isFaceDown:
                shape
                    .fill()
            }
        }
        .onTapGesture {
            cardIsFaceUp.toggle()
        }
    }
}
