import SwiftUI

struct ContentView: View {
    @EnvironmentObject var memorizeGame: MemorizeGame
    
    var body: some View {
        VStack {
            ScrollView {
                HStack() {
                    ThemeNameView()
                    ScoreView()
                        .frame(width: 150, alignment: .trailing)
                }
                CardListView()
            }
            Spacer()
            NewGameButton()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
