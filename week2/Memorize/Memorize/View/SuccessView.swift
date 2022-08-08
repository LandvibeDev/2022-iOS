import SwiftUI

struct SuccessView: View {
    let score: Int
    
    var body: some View {
        VStack{
            Text("Well Done!!").padding(.top, 150)
            Text("You got \(score) Points!!")
        }
        .font(.title)
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(score: 1)
    }
}
