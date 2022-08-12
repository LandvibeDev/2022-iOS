//
//  GameOverView.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/06.
//

import SwiftUI

struct GameOverView: View {
    var point: Int
    var body: some View {
        VStack{
            VStack {
                Text("Well Done !!")
                Text("You got \(point) Points !!")
            }
            .foregroundColor(.red)
            .font(.title)
        }
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(point: 100)
    }
}
