import SwiftUI

struct ContentView: View {
    @StateObject private var memorizeGame = MemorizeGame()
    var body: some View {
        VStack {
            ScrollView {
                Text("Memorize!")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                CardListView()
                    .environmentObject(memorizeGame)
            }
            Spacer()
            ButtonBar()
                .environmentObject(memorizeGame)
        }
        .foregroundColor(.red)
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
