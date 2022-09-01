//
//  ApiTestApp.swift
//  ApiTest
//
//  Created by 임주민 on 2022/09/01.
//

import SwiftUI

@main
struct ApiTestApp: App {
    var body: some Scene {
        WindowGroup {
          let viewModel = BookFinder()
            BookList(viewModel: viewModel)
        }
    }
}
