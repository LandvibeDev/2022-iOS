//
//  NewsDesk.swift
//  NaverOpenAPITest
//
//  Created by ohhyeongseok on 2022/09/02.
//

import Foundation

struct NewsDesk {
    var searchKeyword = ""
    var news: [News] = []
    var path = "/v1/search/news.json"
}

extension NewsDesk{
    
    struct News: Codable, Identifiable {
        let attributedTitle: AttributedString?
        let originalLink: String
        let link: String
        let description: String
        let pubDate: String
        let id: Int
        
        init(_ news: NewsResponse.News, id: Int) {
            attributedTitle = AttributedString(htmlString: news.title)
            pubDate = news.pubDate
            originalLink = news.originallink
            link = news.link
            description = news.description
            self.id = id
        }
    }
}
