import SwiftUI

struct CardView: View {
    @EnvironmentObject var memorizeGame: MemorizeGame
    var content: String
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            } else {
                shape.fill().foregroundColor(memorizeGame.currentTheme.cardColor.color)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "emotion")
    }
}


