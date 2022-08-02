import SwiftUI

struct ContentView: View {
    @EnvironmentObject var memorizeGame: MemorizeGame
    var body: some View {
        VStack {
            ScrollView {
                ThemeNameView()
                CardListView()
            }
            Spacer()
            
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
