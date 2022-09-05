//
//  Department.swift
//  NaverOpenAPITest
//
//  Created by ohhyeongseok on 2022/09/02.
//

import Foundation

struct Encyclopedia {
    var searchKeyword = ""
    var documents: [Document] = []
    var path = "/v1/search/encyc.json"
}

extension Encyclopedia {
    
    struct Document: Codable, Identifiable {
        let attributedTitle: AttributedString?
        let link: String
        let description: String
        let tumbnail: String
        let id: Int
        
        init(_ document: Response.Document, id: Int) {
            attributedTitle = AttributedString(htmlString: document.title)
            link = document.link
            description = document.description
            tumbnail = document.thumbnail
            self.id = id
        }
    }
}
