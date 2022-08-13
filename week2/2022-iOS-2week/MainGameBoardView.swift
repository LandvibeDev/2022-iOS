
import SwiftUI

struct MainGameBoardView: View {
    @EnvironmentObject private var manager: MemorizeGameManger
    
    var body: some View {
        VStack {
            if manager.finishThisRound {
                VStack {
                    Spacer()
                    Text("Finish this round")
                        .font(.system(size: 40))
                    Text("you got \(manager.gameModel.point) Points")
                    Spacer()
                }
            }
            else {
                TitleView()
                Spacer()
                CardListView()
            }
            BottomButtonList()
        }
        .foregroundColor(manager.themeModel.current.color)
        .padding()
    }
}
