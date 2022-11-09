//
//  ContentView.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import SwiftUI

struct CalculatorView: View {
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
        VStack {
            Spacer()
            ScreenView(displayValue: calculatorManager.displayValue)
                .contentShape(Rectangle())
                .gesture(swipe())
            PadView()
        }
        .background(.black)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .environmentObject(CalculatorManager())
    }
}
