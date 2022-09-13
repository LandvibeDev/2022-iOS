//
//  CustomError.swift
//  NaverOpenAPITest
//
//  Created by Byeongjo Koo on 2022/09/05.
//

import Foundation

enum CustomError: Error {
    
    case url
    case connectionFail
    case decoding
    
    case badRequest
    case internalServer
    case unknown
}
