//
//  BoxOffice.swift
//  NaverOpenAPITest
//
//  Created by Byeongjo Koo on 2022/08/28.
//

import Foundation

struct BoxOffice {
    
    var movies: [Movie] = []
}

// MARK: - Movie

extension BoxOffice {
    
    struct Movie: Codable, Identifiable {
        
        let title: String
        let thumbnail: String
        let subtitle: String
        let releaseDate: String
        let director: String
        let actors: String
        let userRating: String
        let id: Int
        
        // MARK: Initializer(s)
        
        init(_ movie: NaverOpenAPI.Movie.Response.Item, id: Int) {
            title = String(htmlString: movie.title)
            thumbnail = movie.thumbnail
            subtitle = String(htmlString: movie.subtitle)
            releaseDate = movie.releaseDate
            director = movie.director
            actors = movie.actors
            userRating = movie.userRating
            self.id = id
        }
    }
}
