//
//  MovieList.swift
//  NaverOpenAPITest
//
//  Created by ohhyeongseok on 2022/09/01.
//

import SwiftUI

struct MovieList: View {
    
    @ObservedObject var viewModel: MovieFinder
    
    var body: some View {
        ZStack {
            List {
                HStack {
                    TextField(text: $viewModel.model.searchKeyword, label: {
                        Text("검색어를 입력하세요.") })
                    Button(action: {viewModel.fetchMovieList() }) {
                        Text("검색")
                    }
                    .buttonStyle(.bordered)
                }
                Section {
                    ForEach(viewModel.model.movies) { movie in
                        VStack {
                            Spacer()
                            Group {
                                if let attributedTitle = movie.attributedTitle {
                                    Text(attributedTitle)
                                } else {
                                    Text("알 수 없음")
                                }
                            }
                            .font(Font.system(size: 15))
                            .minimumScaleFactor(0.5)
                            Spacer()
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
