//
//  CardView.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

struct CardView: View, Memorize{
    @State var isFaceUp = true
    let content: ImageAndText
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                
                shape
                    .strokeBorder(lineWidth: 5)
                    .foregroundColor(.blue)
                
                VStack{
                    Text(content.Image)
                        .font(.largeTitle)

                    Text(content.Text)
                }
            } else {
                shape
                    .fill()
                    .foregroundColor(.blue)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: ImageAndText("🥞","팬 케이트"))
    }
}
