//
//  ContentView.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject var calculatorManager: CalculatorManager

    var body: some View {
        VStack {
            ScreenView()
                .contentShape(Rectangle())
                .gesture(DragGesture(minimumDistance: 10, coordinateSpace: .local)
                    .onEnded({ _ in
                        calculatorManager.backWhenSwiped()
                    }))
            PadView()
        }
        .background(Color.black)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
