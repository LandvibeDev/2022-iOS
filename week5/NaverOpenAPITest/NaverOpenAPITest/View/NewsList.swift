//
//  NewsList.swift
//  NaverOpenAPITest
//
//  Created by ohhyeongseok on 2022/09/02.
//


import SwiftUI

struct NewsList: View {
    @ObservedObject var newsFinder: Finder
    
    var body: some View {
        ZStack {
            List {
                HStack {
                    TextField(text: $newsFinder.newsDesk.searchKeyword, label: {
                        Text("검색어를 입력하세요.") })
                    Button(action: {newsFinder.fetchNews() }) {
                        Text("검색")
                    }
                    .buttonStyle(.bordered)
                }
                Section {
                    ForEach(newsFinder.newsDesk.news) { movie in
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
            if newsFinder.fetchingStatus == .fetching {
                ProgressView()
                    .scaleEffect(1.5)
            }
        }
        .foregroundColor(.black)
    }
}