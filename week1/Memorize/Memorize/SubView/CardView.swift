//
//  CardView.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

struct CardView: View{
    
    let content: ImageAndText
    
    @State private var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                
                shape
                    .strokeBorder(lineWidth: 5)
                
                VStack{
                    Text(content.Image)
                        .font(.largeTitle)

                    Text(content.Text)
                }
            } else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
