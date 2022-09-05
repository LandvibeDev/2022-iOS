//
//  String+Extension.swift
//  NaverOpenAPITest
//
//  Created by Byeongjo Koo on 2022/09/06.
//

import Foundation

extension String {
    
    /// HTML형식의 문자열을 기본 문자열로 변환합니다.
    /// - Parameter htmlString: HTML 형식의 문자열.
    init(htmlString: String) {
        let option: [NSAttributedString.DocumentReadingOptionKey: NSAttributedString.DocumentType] = [.documentType: .html]
        if let htmlData = htmlString.data(using: .utf16),
           let nsStr = try? NSAttributedString(data: htmlData, options: option, documentAttributes: nil) {
            self.init(nsStr.string)
        } else {
            self.init("값을 가져오지 못했습니다.")
        }
    }
}
