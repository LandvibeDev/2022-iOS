//
//  ButtonView.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/15.
//

import SwiftUI

struct ButtonView: View {
    
    let symbols: Symbol.Text
    var body: some View {
        let shape = Circle()
            .fill(Color.darkGray)
        Button {
            //여기서 Calculator의 operator와 연결(그래서 symbol을 통째로 가져온것임.)
        } label: {
            GeometryReader { geometry in
                ZStack {
                    shape
                    Text("\(symbols.rawValue)")
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


extension ButtonView {
    private enum DrawConstants {
        
        static let fontScale: CGFloat = 0.5
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(symbols: Symbol.Text.addition).preferredColorScheme(.dark)
    }
}
