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
        ZStack {
            Color.gray.opacity(0.1)
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            HStack {
                TextField(text: $viewModel.model.searchKeyword, label: { Text("검색어를 입력하세요.") })
                Button(action: { viewModel.fetchImageList()}) {
                    Text("검색")
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: ImageFinder())
    }
}
