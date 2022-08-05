import SwiftUI

struct NewGameButton: View {
    @EnvironmentObject var memorizeGame: MemorizeGameDealer
    
    var body: some View {
        Button("New Game") {
            memorizeGame.changeTheme(nextTheme: Theme.randomTheme)
        }
    }
}

struct NewStartButton_Previews: PreviewProvider {
    static var previews: some View {
        NewGameButton()
    }
}
