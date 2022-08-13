
import SwiftUI

struct TitleView: View {
    @EnvironmentObject private var manager: MemorizeGameManger
    
    var body: some View {
        ZStack() {
            Text(manager.themeModel.current.name)
                .font(.system(size: 45))
            Text("point: " + "\(manager.gameModel.point)")
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
