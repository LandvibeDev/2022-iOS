import SwiftUI

struct NewGameButton: View {
    @EnvironmentObject var memorizeGameDealer: MemorizeGameDealer
    
    var body: some View {
        Button("New Game") {
            memorizeGameDealer.newGame()
        }
    }
}

struct NewStartButton_Previews: PreviewProvider {
    static var previews: some View {
        NewGameButton()
    }
}
