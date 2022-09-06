//
//  MovieDetailView.swift
//  NaverOpenAPITest
//
//  Created by Byeongjo Koo on 2022/09/06.
//

import SwiftUI

import Kingfisher

struct MovieDetailView: View {
    
    let movie: BoxOffice.Movie
    
    var body: some View {
        HStack {
            KFImage(URL(string: movie.thumbnail))
                .cancelOnDisappear(true)
                .placeholder { _ in
                    ProgressView()
                }
                .resizable()
                .frame(width: DrawingConstants.thumbnailWidth)
                .aspectRatio(DrawingConstants.thumbnailAspectRatio, contentMode: .fit)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title3)
                    .bold()
                    .lineLimit(DrawingConstants.DescriptionLineLimit)
                Text(movie.subtitle)
                    .font(.body)
                    .lineLimit(DrawingConstants.DescriptionLineLimit)
                Text(movie.actors)
                    .font(.caption)
                    .lineLimit(DrawingConstants.DescriptionLineLimit)
                Spacer(minLength: 0)
            }
            .padding()
        }
    }
}

// MARK: - Constant(s)

extension MovieDetailView {
    
    private enum DrawingConstants {
        
        static let thumbnailWidth: CGFloat = 100
        static let thumbnailAspectRatio: CGFloat = 1
        static let DescriptionLineLimit = 2
    }
}
