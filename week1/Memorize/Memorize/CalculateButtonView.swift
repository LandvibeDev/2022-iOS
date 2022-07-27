//
//  calculateButtonView.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/07/27.
//

import SwiftUI

struct CalculateButtonView: View {
    @EnvironmentObject var toBeObserved : ToBeObserved
    var isPlus: Bool
    init(isPlus: Bool)
    {
        self.isPlus = isPlus
    }
    
    var body: some View {
        if(isPlus)
        {
            Button {
                if(toBeObserved.currentTheme.maxNumber > toBeObserved.cardNumber)
                {
                    toBeObserved.cardNumber += 1
                }
            } label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: 20))
            }
        }
        else
        {
            Button {
                if(toBeObserved.cardNumber > 0)
                {
                    toBeObserved.cardNumber -= 1
                }
            } label: {
                Image(systemName: "minus.circle")
                    .font(.system(size: 20))
            }
        }
    }
}

