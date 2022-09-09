//
//  ImageBox.swift
//  NetworkModule
//
//  Created by Kyungsoo Lee on 2022/09/07.
//

import Foundation

struct ImageBox {
    var searchKeyword = ""
    var images: [ImageInfo] = []
}

extension ImageBox {
    struct ImageInfo: Codable, Identifiable {
        let attributedTitle: AttributedString?
        let link: String
        let thumbnail: String
        let sizeheight: String
        let sizewidth: String
        let id: Int
        
        init(_ imageInfo: ImageFinder.Response.ImageInfo, id: Int) {
            attributedTitle = AttributedString(htmlString: imageInfo.title)
            link = imageInfo.link
            thumbnail = imageInfo.thumbnail
            sizeheight = imageInfo.sizeheight
            sizewidth = imageInfo.sizewidth
            self.id = id
        }
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
