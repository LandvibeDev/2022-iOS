//
//  ThemeButtonView.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

struct ThemeButtonListView: View {
    
    let columns: [GridItem] = {
        var columnsToInit = [GridItem]()
        MemorizeCardGameManger.themeList.forEach{ element in
            columnsToInit.append(GridItem())
        }
        return columnsToInit
    }()
    
    var body: some View {
        HStack{
            Spacer()
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(MemorizeCardGameManger.themeList){ element in
                    ThemeButtonView(content: element)
                }
            }
        }
        Spacer()
    }
}

