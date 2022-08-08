import SwiftUI

struct MemorizeGameView: View {
    @EnvironmentObject var memorizeGameDealer: MemorizeGameDealer
    
    var body: some View {
        if memorizeGameDealer.isFinished {
            VStack {
                SuccessView(score: memorizeGameDealer.score)
                Spacer()
                NewGameButton()
            }
            .foregroundColor(memorizeGameDealer.themeColor)
        } else {
            VStack {
                ScrollView {
                    HStack {
                        ThemeNameView(currentThemeName: memorizeGameDealer.currentThemeName)
                        ScoreView(score: memorizeGameDealer.score)
                            .frame(width: 150, alignment: .trailing)
                    }
                    CardListView()
                    Spacer()
                }
                .padding()
                NewGameButton()
            }
            .foregroundColor(memorizeGameDealer.themeColor)
        }
    }
}

struct MemorizeGameView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeGameView()
    }
}
