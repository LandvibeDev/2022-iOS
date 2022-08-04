import SwiftUI

struct ContentView: View {
    @EnvironmentObject var memorizeGame: MemorizeGame
    
    var body: some View {
        if !memorizeGame.checkGameIsDone() {
            VStack {
                ScrollView {
                    HStack() {
                        ThemeNameView()
                        ScoreView()
                            .frame(width: 150, alignment: .trailing)
                    }
                    CardListView()
                    Spacer()
                }
                .padding()
                NewGameButton()
            }
        }
        else {
            SuccessView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
