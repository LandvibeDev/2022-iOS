//
//  SearchFormView.swift
//  NaverOpenAPITest
//
//  Created by Byeongjo Koo on 2022/08/28.
//

import SwiftUI

struct SearchFormView: View {
    
    @EnvironmentObject var movieFinder: MovieFinder
    
    var body: some View {
        NavigationView {
            ZStack {
                searchFormList
                VStack {
                    Spacer()
                    searchButton
                }
            }
            .navigationTitle(Texts.navigationTitle)
        }
    }
    
    // MARK: - SubView(s)
    
    var searchFormList: some View {
        List {
            VStack {
                searchTextField
                if movieFinder.isKeywordCorrectable {
                    correctionButton
                }
            }
            genreSelectionView
        }
    }
    
    var searchTextField: some View {
        HStack {
            TextField(text: $movieFinder.searchForm.keyword, label: { Text(Texts.searchPlaceholder) })
            if movieFinder.fetchStatus == .fetching {
                ProgressView()
                    .foregroundColor(.black)
            }
        }
        .padding(DrawingConstants.searchTextFieldPadding)
        .background(Color.lightGray)
        .clipShape(RoundedRectangle(cornerRadius: DrawingConstants.searchTextFieldCornerRadius))
    }
    
    var correctionButton: some View {
        Button(action: {
            movieFinder.handleTypo()
        }, label: {
            Text(Texts.correctionPrefix + movieFinder.searchForm.correction + Texts.correctionSuffix)
                .font(.caption)
                .foregroundColor(.red)
        })
    }
    
    var genreSelectionView: some View {
        Picker(Texts.genreTitle, selection: $movieFinder.searchForm.genre) {
            ForEach(SearchForm.Genre.allCases) { genre in
                Text(genre.rawValue.capitalized)
            }
        }
        .padding(DrawingConstants.genreSelectionPadding)
    }
    
    var searchButton: some View {
        NavigationLink(destination: {
            MovieListView()
        }, label: {
            RoundedRectangle(cornerRadius: DrawingConstants.searchButtonCornerRadius)
                .foregroundColor(movieFinder.searchForm.isProceedable ? .blue : .gray)
                .overlay {
                    Text(Texts.searchButtonTitle)
                        .foregroundColor(.white)
                }
                .frame(height: DrawingConstants.searchButtonHeight, alignment: .center)
        })
        .disabled(!movieFinder.searchForm.isProceedable)
        .padding()
    }
}

// MARK: - Constant(s)

extension SearchFormView {
    
    private enum Texts {
        
        static let navigationTitle = "영화검색"
        static let searchPlaceholder = "검색어를 입력하세요."
        static let genreTitle = "장르"
        static let correctionPrefix = "\""
        static let correctionSuffix = "\"(으)로 검색하시겠습니까 ?"
        static let searchButtonTitle = "검색"
    }
    
    private enum DrawingConstants {
        
        static let searchTextFieldPadding: CGFloat = 7
        static let searchTextFieldCornerRadius: CGFloat = 5
        static let genreSelectionPadding: CGFloat = 5
        static let searchButtonCornerRadius: CGFloat = 10
        static let searchButtonHeight: CGFloat = 50
    }
}
