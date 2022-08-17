//
//  ButtonView.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/15.
//

import SwiftUI

struct ButtonView: View {
    
    let text: Symbol.Text
    var body: some View {
        
        
        Button {
            //Test Log
            print(1.0 + 2.0)
            //여기서 Calculator의 operator와 연결(그래서 symbol을 통째로 가져온것임.)
        } label: {
            GeometryReader { geometry in
                ZStack {
                    if text == .zero {
                        RoundedRectangle(cornerRadius: 100)
                            .fill(Color.darkGray)
                        
                    } else {
                        Circle()
                            .fill(Color.darkGray)
                    }
                        Text("\(text.rawValue)")
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
        ButtonView(text: Symbol.Text.zero).preferredColorScheme(.dark)
    }
}
