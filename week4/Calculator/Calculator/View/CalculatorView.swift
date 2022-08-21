//
//  ContentView.swift
//  Calculator
//
//  Created by ohhyeongseok on 2022/08/16.
//

import SwiftUI

struct CalculatorView: View {
    var body: some View {
        VStack {
            Spacer()
            ScreenView()
            PadView()
        }
        .gesture(DragGesture(minimumDistance: 10, coordinateSpace: .local)
            .onEnded({ _ in
                calculatorManager.backWhenSwiped()
            }))
        .background(Color.black)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
