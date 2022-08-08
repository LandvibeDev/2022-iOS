import SwiftUI

struct MemorizeGameView: View {
    @EnvironmentObject var memorizeGame: MemorizeGameDealer
    
    var body: some View {
        if memorizeGame.gameIsFinished {
            VStack {
                SuccessView(score: memorizeGame.score)
                Spacer()
                NewGameButton()
            }
            .foregroundColor(memorizeGame.themeColor)
        }
        else {
            VStack {
                ScrollView {
                    HStack {
                        ThemeNameView(currentThemeName: memorizeGame.currentThemeName)
                        ScoreView(score: memorizeGame.score)
                            .frame(width: 150, alignment: .trailing)
                    }
                    CardListView()
                    Spacer()
                }
                .padding()
                NewGameButton()
            }
            .foregroundColor(memorizeGame.themeColor)
        }
    }
}

struct MemorizeGameView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeGameView()
    }
}
