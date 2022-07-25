//
//  ContentView.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

struct MainGameBoardView: View {
    
   
    
    var body: some View {
        VStack{
            TitleView()
            Spacer()
            MemorizeButtonListView()
        }
        .padding()
    }
}

struct MainGameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        MainGameBoardView()
    }
}
