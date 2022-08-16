//
//  NumberView.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/15.
//

import SwiftUI

struct NumberView: View {
    
    let number: Int
    var body: some View {
        let shape = Circle()
            .fill(Color.darkGray)
        Button {
            
        } label: {
            GeometryReader { geometry in
                ZStack {
                    shape
                    Text("\(number)")
                        .font(font(in: geometry.size))
                        .foregroundColor(.white)
                }
            }
        }
    }
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawConstants.fontScale)
    }
}


extension NumberView {
    private enum DrawConstants {
        
        static let fontScale: CGFloat = 0.5
        
    }
}

struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
        NumberView(number: 5).preferredColorScheme(.dark)
    }
}
