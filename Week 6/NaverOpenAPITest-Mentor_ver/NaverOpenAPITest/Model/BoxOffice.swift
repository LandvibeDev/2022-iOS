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
        
        let attributedTitle: String
        let image: String
        let subtitle: String
        let pubDate: String
        let director: String
        let actor: String
        let userRating: String
        let id: Int
        
        // MARK: Initializer(s)
        
        init(_ movie: NaverOpenAPI.Movie.Response.Item, id: Int) {
            attributedTitle = String(htmlString: movie.title)
            image = movie.image
            subtitle = String(htmlString: movie.subtitle)
            pubDate = movie.pubDate
            director = movie.director
            actor = movie.actor
            userRating = movie.userRating
            self.id = id
        }
    }
}
