import SwiftUI

struct CardView: View {
    @EnvironmentObject var memorizeGame: MemorizeGame
    @ObservedObject var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 5)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.fill(.white)
            } else {
                shape.fill().foregroundColor(memorizeGame.themeColor)
            }
        }
        .onTapGesture {
            if !card.isMatched {
                memorizeGame.choose(card)
            }
            
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: MemoryGame<String>.Card(content: "aa", id: 1))
    }
}


