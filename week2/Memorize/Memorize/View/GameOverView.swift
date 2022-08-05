//
//  GameOverView.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/06.
//

import SwiftUI

struct GameOverView: View {
    var body: some View {
        VStack{
            VStack {
                Text("Well Done !!")
                Text("You got ~ Points !!")
            }
            .foregroundColor(.red)
            .font(.title)
            .padding(EdgeInsets(top: 295, leading: 0, bottom: 0, trailing: 0))
            FooterView()
                .padding(EdgeInsets(top: 295, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
    }
}
