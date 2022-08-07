
import SwiftUI

struct MainGameBoardView: View {
    @EnvironmentObject var gameManager: MemorizeGameManger
    
    var body: some View {
        VStack {
            if gameManager.gameManage.shouldFinishThisRound {
                VStack{
                    Spacer()
                    Text("Finish this round")
                        .font(.system(size: 40))
                    Text("you got \(gameManager.gameManage.point) Points")
                    Spacer()
                }
            }
            else {
                TitleView()
                    .foregroundColor(gameManager.themeModel.current.color)
                CardListView()
            }
            BottomButtonList()
        }
        .onAppear(){
            gameManager.tappedNewGame()
        }
        .foregroundColor(gameManager.themeModel.current.color)
        .padding()
    }
}
