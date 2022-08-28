import SwiftUI

struct ScoreView: View {
    let score: Int
    
    var body: some View {
        Text("Score:\(score)").font(.title)
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 1)
    }
}
