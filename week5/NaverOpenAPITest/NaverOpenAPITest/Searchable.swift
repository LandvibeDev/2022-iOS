//
//  MyProtocol.swift
//  NaverOpenAPITest
//
//  Created by ohhyeongseok on 2022/09/02.
//

import Foundation

protocol Searchable {
    var path: String {get}
    var searchKeyword: String {get}
    init()
    var elements: [Any] {get set}
}
