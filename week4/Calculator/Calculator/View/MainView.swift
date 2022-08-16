//
//  MainView.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/15.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Spacer()
            result
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
    
    var result: some View {
        Text("0").font(.largeTitle)
    }
    
//    var numberBoard: some View {
//
//    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
