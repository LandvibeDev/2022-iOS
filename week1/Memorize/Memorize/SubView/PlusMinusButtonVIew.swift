//
//  PlusMinusButtonVIew.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

struct PlusMinusButtonVIew: View {
    //true means plus mode
    //false meas minus mode
    var mode: Bool
    
    @EnvironmentObject var gameManager: MemorizeCardGameManger
    
    var body: some View {
        Button(action: {
            if mode {
                gameManager.addOrSubtractCard(oneOrMinusOne: 1)
            }
            else {
                gameManager.addOrSubtractCard(oneOrMinusOne: -1)
            }
        }){
            Image(systemName: mode ? "plus.app" : "minus.square")
                .font(.largeTitle)
                .padding()
          
        }
        
    }
}

//struct PlusMinusButtonVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        PlusMinusButtonVIew(mode: true)
//    }
//}
