//
//  MovieListView.swift
//  NaverOpenAPITest
//
//  Created by Byeongjo Koo on 2022/09/04.
//

import SwiftUI

struct MovieListView: View {
    
    @EnvironmentObject var movieFinder: MovieFinder
    
    var body: some View {
        List {
            ForEach(movieFinder.boxOffice.movies) { movie in
                MovieDetailView(movie: movie)
            }
        }
        .onAppear(perform: {
            movieFinder.fetchMovies()
        })
        .onDisappear(perform: {
            movieFinder.cancelMovieFetchingStream()
        })
        .navigationTitle(Texts.navigationTitle)
    }
}

// MARK: - Constant(s)

extension MovieListView {
    
    private enum Texts {
        
        static let navigationTitle = "검색결과"
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
