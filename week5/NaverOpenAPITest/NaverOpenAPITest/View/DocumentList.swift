//
//  DocumentList.swift
//  NaverOpenAPITest
//
//  Created by ohhyeongseok on 2022/09/02.
//

import SwiftUI

struct DocumentList: View {
    @ObservedObject var documentFinder: Finder
    
    var body: some View {
        ZStack {
            List {
                HStack {
                    TextField(text: $documentFinder.documentModel.searchKeyword, label: {
                        Text("검색어를 입력하세요.") })
                    Button(action: {documentFinder.fetchDocument() }) {
                        Text("검색")
                    }
                    .buttonStyle(.bordered)
                }
                Section {
                    ForEach(documentFinder.documentModel.documents) { movie in
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
            if documentFinder.fetchingStatus == .fetching {
                ProgressView()
                    .scaleEffect(1.5)
            }
        }
        .foregroundColor(.black)
    }
}
