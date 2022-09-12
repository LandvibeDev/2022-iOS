//
//  ScreenView.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/18.
//

import SwiftUI

struct ScreenView: View {
    let displayValue: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(displayValue)
                .lineLimit(DrawConstants.lineLimit)
                .foregroundColor(.white)
                .frame(alignment: .bottomTrailing)
                .font(.system(size: DrawConstants.fontSize))
                .minimumScaleFactor(DrawConstants.minimumScaleFactor)
                .padding()
        }
    }
}

// MARK: - Constant(s)

extension ScreenView {
    private enum DrawConstants {
        static let lineLimit: Int = 1
        static let minimumScaleFactor: CGFloat = 0.5
        static let fontSize: CGFloat = 80
    }
}

struct ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenView(displayValue: "aa")
    }
}
