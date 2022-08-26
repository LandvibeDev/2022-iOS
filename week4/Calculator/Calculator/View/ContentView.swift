//
//  ContentView.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var calculatorManager: CalculatorManager
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                ResultView(showingText: calculatorManager.showingText)
                CalculatorButtonGrid(items: calculatorManager.buttonList , columnsCount: 4) { item in
                    ButtonView(buttonData: item)
                        .onTapGesture { calculatorManager.click(item) }
                }
            }
        }.foregroundColor(.white)
    }
}
