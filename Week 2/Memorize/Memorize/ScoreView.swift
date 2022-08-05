import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var memorizeGame: MemorizeGameDealer
    
    var body: some View {
        Text("Score:\(memorizeGame.score)")
            .font(.title)
            .foregroundColor(memorizeGame.themeColor)
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
