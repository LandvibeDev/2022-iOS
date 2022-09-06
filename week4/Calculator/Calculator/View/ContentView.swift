//
//  ContentView.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var calculatorManager: CalculatorManager
    
    var body: some View {
        
        ZStack{
            
            Color.black.ignoresSafeArea()
            VStack {
                
                Spacer()
                ResultView(showingText: calculatorManager.showingText)
                    .gesture(
                        DragGesture()
                            .onEnded { _ in calculatorManager.slideToRemove() }
                    )
                NumberPad(items: ContentView.buttonList , columnsCount: 4) { item in
                    
                    Button { calculatorManager.click(item) }
                    label: { CalculatorButton(buttonData: item) }
                }
            }
        }
    }
}

extension ContentView {
    
    static let buttonList: [Calculator.ArithmeticOperation] =
    [
        .clear, .sign, .percent, .divide,
        .number(7), .number(8), .number(9), .multiply,
        .number(4), .number(5), .number(6), .minus,
        .number(1), .number(2), .number(3), .plus,
        .number(0), .point, .equal
    ]
}
