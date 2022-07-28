//
//  PlusMinusButtonVIew.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

///true means plus mode
///false meas minus mode
struct PlusMinusButtonView: View {
   
    var mode: Bool
    
    @EnvironmentObject var gameManager: MemorizeCardGameManger
    
    var body: some View {
        Button(action: {
            if mode {
                gameManager.plusCard()
            }
            else {
                gameManager.minusCard()
            }
        }){
            Image(systemName: mode ? "plus.app" : "minus.square")
                .padding()
        }
    }
}
