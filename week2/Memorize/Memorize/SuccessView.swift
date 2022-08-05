import SwiftUI

struct SuccessView: View {
    @EnvironmentObject var memorizeGame: MemorizeGameDealer
    
    var body: some View {
        VStack{
            Text("Well Done!!")
                .padding(.top, 150)
            Text("You got \(memorizeGame.score) Points!!")
        }
        .font(.title)
        .foregroundColor(.red)
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
