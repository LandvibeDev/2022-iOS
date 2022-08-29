//
//  ScreenView.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/18.
//

import SwiftUI

struct ScreenView: View {
    @EnvironmentObject var calculatorManager: CalculatorManager
    
    private func swipe() -> some Gesture {
        DragGesture(minimumDistance: 10, coordinateSpace: .local)
            .onEnded { drag in
                if 0 < drag.translation.width {
                    calculatorManager.undoWhenSwiped()
                }
            }
    }
    
    var body: some View {
        HStack {
            Spacer()
            Text(calculatorManager.displayValue)
                .lineLimit(DrawConstants.lineLimit)
                .foregroundColor(.white)
                .frame(alignment: .bottomTrailing)
                .font(.system(size: DrawConstants.fontSize))
                .minimumScaleFactor(DrawConstants.minimumScaleFactor)
                .padding()
        }
        .contentShape(Rectangle())
        .gesture(swipe())
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
        ScreenView()
    }
}
