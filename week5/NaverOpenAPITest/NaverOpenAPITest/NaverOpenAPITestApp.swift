//
//  NaverOpenAPITestApp.swift
//  NaverOpenAPITest
//
//  Created by Kyungsoo Lee on 2022/09/01.
//

import SwiftUI

@main
struct NaverOpenAPITestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: MovieFinder())
        }
    }
}
