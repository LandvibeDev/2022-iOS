import SwiftUI

struct ContentView: View {
    @StateObject private var admin = Admin()
    var body: some View {
        VStack {
            ScrollView {
                Text("Memorize!")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                CardListView()
                    .environmentObject(admin)
            }
            Spacer()
            ButtonBar()
                .environmentObject(admin)
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
