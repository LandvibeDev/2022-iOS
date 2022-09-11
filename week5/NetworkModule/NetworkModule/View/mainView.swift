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
            Section {
                ForEach(viewModel.model.images) { image in
                    VStack {
                        Group {
                            AsyncImage(url: URL(string: String(image.link)))
                            Text("\(image.link)")
                            Image(image.link)
                        }
                    }
                }
            }
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
