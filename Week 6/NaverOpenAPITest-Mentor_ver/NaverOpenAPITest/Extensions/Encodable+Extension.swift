//
//  Encodable+Extension.swift
//  NaverOpenAPITest
//
//  Created by Byeongjo Koo on 2022/09/05.
//

import Foundation

extension Encodable {
    
    /// 객체를 문자열 딕셔너리로 만들어 옵셔널로 반환합니다.
    var stringDictionary: [String: String]? {
        guard let data = self.encodedJSONData,
              let anyDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
        else { return nil }
        var dictionary: [String: String] = [:]
        anyDictionary.forEach { dictionary[$0] = "\($1)" }
        return dictionary
    }
    
    /// JSON 형식의 데이터를 옵셔널로 반환합니다.
    var encodedJSONData: Data? {
        try? JSONEncoder().encode(self)
    }
}
