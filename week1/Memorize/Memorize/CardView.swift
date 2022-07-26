//
//  CardView.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/07/26.
//

import SwiftUI

struct CardView: View {
    @State var isFaceUp = true
       let content: String
       
       var body: some View {
           ZStack {
               let shape = RoundedRectangle(cornerRadius: 20)
               if isFaceUp {
                   shape.fill().foregroundColor(.white)
                   shape.strokeBorder(lineWidth: 5)
                   Text(content).font(.largeTitle)
               } else {
                   shape.fill()
               }
           }
           .onTapGesture {
               isFaceUp.toggle()
           }
       }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView( content: "abc")
    }
}


