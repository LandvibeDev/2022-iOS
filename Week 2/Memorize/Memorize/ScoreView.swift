//
//  ScoreView.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/08/03.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var memorizeGame: MemorizeGame
    
    var body: some View {
        Text("Score:\(memorizeGame.score)")
            .font(.title)
            .foregroundColor(memorizeGame.themeColor)
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
