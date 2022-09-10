//
//  ImageList.swift
//  NetworkModule
//
//  Created by Kyungsoo Lee on 2022/09/06.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ImageFinder
    
    var body: some View {
        List {
            HStack {
                TextField(text: $viewModel.model.searchKeyword, label: { Text("검색어를 입력하세요.") })
                Button(action: { viewModel.fetchImageList()}) {
                    Text("검색")
                }
            }
            Section {
                ForEach(viewModel.model.images) { image in
                    VStack {
                        Text("\(image.link)")
                        Image(image.link)
                    }

                }
            }
        }
        
        .buttonStyle(.bordered)
    }
}

struct ImageList_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ImageFinder())
    }
}
