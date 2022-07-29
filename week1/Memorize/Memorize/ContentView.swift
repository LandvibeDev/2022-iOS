import SwiftUI

struct ContentView: View {
    @StateObject private var toBeObserved = ToBeObserved()
    var body: some View {
        VStack {
            ScrollView {
                Text("Memorize!")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                CardListView()
                    .environmentObject(toBeObserved)
            }
            Spacer()
            ButtonView()
                .environmentObject(toBeObserved)
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
