//
//  AttributedString+Extension.swift
//  NaverOpenAPITest
//
//  Created by ohhyeongseok on 2022/09/02.
//

import Foundation

extension AttributedString {
    /// HTML형식의 문자열을 기본 문자열로 변환합니다.
    /// - Parameter htmlString: HTML 형식의 문자열.
    init?(htmlString: String) {
        let option: [NSAttributedString.DocumentReadingOptionKey: NSAttributedString.DocumentType] = [.documentType: .html]
        guard let htmlData = htmlString.data(using: .utf16),
              let nsStr = try? NSAttributedString(data: htmlData, options: option, documentAttributes: nil)
        else { return nil }
        self.init(nsStr.string)
    }
}
