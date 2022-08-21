//
//  ContentView.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import SwiftUI

struct ContentView: View {
  
  var body: some View {
    VStack {
      ResultView()
      HStack {
        VStack {
          FunctionButtons()
          NumberPadView()
        }
        ArithmeticOperationButtons()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  
  static var previews: some View {
    ContentView()
  }
}
