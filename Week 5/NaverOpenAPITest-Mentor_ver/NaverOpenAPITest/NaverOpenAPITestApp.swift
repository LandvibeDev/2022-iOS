//
//  NaverOpenAPITestApp.swift
//  NaverOpenAPITest
//
//  Created by Byeongjo Koo on 2022/08/28.
//

import SwiftUI

@main
struct NaverOpenAPITestApp: App {
    var body: some Scene {
        WindowGroup {
            MovieList(viewModel: MovieFinder())
        }
    }
}
