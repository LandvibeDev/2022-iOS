//
//  ResultView.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import SwiftUI

struct ResultView: View {
    
    let showingText: String
    
    var body: some View {
        
        HStack {
            Spacer()
            Text(showingText)
                .lineLimit(1)
                .foregroundColor(.white)
                .font(.system(size: DrawConstans.fontSize))
                .minimumScaleFactor(DrawConstans.fontMinimumSacleFactor)
                .padding(.trailing, DrawConstans.textPadding)
        }
        .contentShape(Rectangle())
    }
}

extension ResultView {
    
    private enum DrawConstans {
        static let fontSize = 80.0
        static let fontMinimumSacleFactor = 0.5
        static let textPadding = 20.0
    }
}
