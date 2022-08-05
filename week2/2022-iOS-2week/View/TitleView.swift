
import SwiftUI

struct TitleView: View {
    @EnvironmentObject var gameManager: MemorizeGameManger
    
    var body: some View {
        ZStack() {
            Text(gameManager.themeModel.current.name)
                .font(.system(size: 45))
            Text("point: " + "\(gameManager.gameManage.point)")
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
