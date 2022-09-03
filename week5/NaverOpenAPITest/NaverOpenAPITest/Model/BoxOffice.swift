//
//  BoxOffice.swift
//  NaverOpenAPITest
//
//  Created by ohhyeongseok on 2022/09/01.
//

import Foundation

struct BoxOffice: Searchable {
    var searchKeyword = ""
    var elements: [Any] = []
    var path = "/v1/search/movie.json"
    
    init() {}
}

extension BoxOffice {
    
    struct Movie: Codable, Identifiable {
        let attributedTitle: AttributedString?
        let image: String
        let subtitle: AttributedString?
        let pubDate: String
        let director: String
        let actor: String
        let userRating: String
        let id: Int
        
        init(_ movie: Response.Movie, id: Int) {
            attributedTitle = AttributedString(htmlString: movie.title)
            image = movie.image
            subtitle = AttributedString(htmlString: movie.subtitle)
            pubDate = movie.pubDate
            director = movie.director
            actor = movie.actor
            userRating = movie.userRating
            self.id = id
        }
    }
}

