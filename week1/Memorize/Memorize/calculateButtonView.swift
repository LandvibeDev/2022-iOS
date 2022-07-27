//
//  calculateButtonView.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/07/27.
//

import SwiftUI

struct calculateButtonView: View {
    @ObservedObject var toBeObserved: ToBeObserved
    var isPlus: Bool
    init(isPlus: Bool, toBeOberved: ToBeObserved)
    {
        self.isPlus = isPlus
        toBeObserved = toBeOberved
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

