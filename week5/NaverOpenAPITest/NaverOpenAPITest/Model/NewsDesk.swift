//
//  NewsDesk.swift
//  NaverOpenAPITest
//
//  Created by ohhyeongseok on 2022/09/02.
//

import Foundation

struct NewsDesk: MyProtocol  {
    var searchKeyword = ""
    var elements: [Any] = []
    var path = "/v1/search/news.json"
    init() {}
}

extension NewsDesk{
    
    struct News: Codable, Identifiable {
        let attributedTitle: AttributedString?
        let originallink: String
        let link: String
        let description: String
        let pubDate: String
        let id: Int
        
        init(_ news: Response.News, id: Int) {
            attributedTitle = AttributedString(htmlString: news.title)
            pubDate = news.pubDate
            originallink = news.originallink
            link = news.link
            description = news.description
            self.id = id
        }
    }
}
