//
//  NetworkModuleApp.swift
//  NetworkModule
//
//  Created by changgyo seo on 2022/08/29.
//

import SwiftUI

@main
struct NetworkModuleApp: App {
    
    let movieFetcher = Finder()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: movieFetcher)
        }
    }
    
}
