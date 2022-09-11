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
        List {
            SearchView(viewModel: viewModel)
            ImageList(viewModel: viewModel)
            if viewModel.fetchingStatus == .fetching {
                ProgressView()
                    .scaleEffect(1.5)
            }
        }
        .foregroundColor(.black)
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ImageFinder())
    }
}
