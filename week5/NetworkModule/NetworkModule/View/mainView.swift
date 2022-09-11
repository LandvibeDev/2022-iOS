//
//  mainView.swift
//  NetworkModule
//
//  Created by Kyungsoo Lee on 2022/09/10.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ImageFinder
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    SearchView(viewModel: viewModel)
                    ImageList(viewModel: viewModel)
                }
                .foregroundColor(.black)
                .navigationTitle("Image Search API")
                if viewModel.fetchingStatus == .fetching {
                    ProgressView()
                        .scaleEffect(1.5)
                }
            }
        }
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ImageFinder())
    }
}
