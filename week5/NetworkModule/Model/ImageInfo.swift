//
//  Image.swift
//  NetworkModule
//
//  Created by Kyungsoo Lee on 2022/09/07.
//

import Foundation

struct ImageBox {
    var searchKeyword = ""
    var images: [Image] = []
}

extension ImageBox {
    struct Image: Codable, Identifiable {
        let id: Int
    }
}

extension AttributedString {
    init?(htmlString: String) {
        let option: [NSAttributedString.DocumentReadingOptionKey: NSAttributedString.DocumentType] = [.documentType: .html]
        guard let htmlData = htmlString.data(using: .utf16),
              let nsStr = try? NSAttributedString(data: htmlData, options: option, documentAttributes: nil)
        else { return nil }
        self.init(nsStr.string)
    }
}
