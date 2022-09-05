//
//  ContentView.swift
//  NetworkModule
//
//  Created by changgyo seo on 2022/08/29.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: Finder
    @State private var movieTitle: String = ""
    
    var body: some View {
        
        VStack {
            Spacer()
            Image(uiImage: viewModel.testResult)
                .frame(width: 300, height: 500, alignment: .center)
            Button {
                
                let parameters: [Movie.Request] = [.query(movieTitle)]
                viewModel.fetchMovieList(parameterList: parameters)
            } label: {
                
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 50, height: 50, alignment: .center)
            }
            TextField("", text: $movieTitle)
                .border(.blue, width: 3)
                .frame(width: 200, height: 70, alignment: .center)
            Spacer()
        }
    }
}
