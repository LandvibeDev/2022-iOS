
import SwiftUI

struct ThemeButtonList: View {
    
    let columns: [GridItem] = {
        return MemorizeCardGameManger.themeList
            .map { _ in GridItem() }
    }()
    
    var body: some View {
        HStack {
            Spacer()
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(MemorizeCardGameManger.themeList) { element in
                    ThemeButton(content: element)
                }
            }
            Spacer()
        }
    }
}
