//
//  ContentView.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/07/25.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var toBeObserved = ToBeObserved()
    var body: some View {
        VStack {
            ScrollView {
                Text("Memorize!")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                CardListView()
                    .environmentObject(toBeObserved)
            }
            Spacer()
            FooterVIew()
                .environmentObject(toBeObserved)
        }
        .foregroundColor(.red)
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
