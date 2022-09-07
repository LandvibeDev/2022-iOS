//
//  ContentView.swift
//  NetworkModule
//
//  Created by Kyungsoo Lee on 2022/09/06.
//

import SwiftUI

fileprivate enum NaverOpenAPI {
    static let clientID = "vfkVCXywSz01QA2Jchtx"
    static let clientSecret = "ZXK_oFQNXc"
    
    static let scheme = "https"
    static let host = "openapi.naver.com"
    
    enum Path: String {
        case image = "v1/search/image.json"
    }
}

class ImageFinder: ObservableObject {
    
}
