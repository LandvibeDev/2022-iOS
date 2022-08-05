//
//  SuccessView.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/08/04.
//

import SwiftUI

struct SuccessView: View {
    @EnvironmentObject var memorizeGame: MemorizeGame
    
    var body: some View {
        VStack {
            Text("Well Done!!")
            Text("You got \(memorizeGame.score) Points!!")
        }
        .font(.title)
        .foregroundColor(.red)
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
