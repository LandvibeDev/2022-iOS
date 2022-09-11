//
//  SearchView.swift
//  NetworkModule
//
//  Created by Kyungsoo Lee on 2022/09/10.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: ImageFinder;
    var body: some View {
        HStack {
            TextField(text: $viewModel.model.searchKeyword, label: { Text("검색어를 입력하세요.") })
            Button(action: { viewModel.fetchImageList()}) {
                Text("검색")
            }
            .buttonStyle(.bordered)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: ImageFinder())
    }
}
