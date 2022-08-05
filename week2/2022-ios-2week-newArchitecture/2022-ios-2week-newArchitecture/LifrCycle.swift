//
//  _022_ios_2week_newArchitectureApp.swift
//  2022-ios-2week-newArchitecture
//
//  Created by changgyo seo on 2022/08/05.
//

import SwiftUI

@main
struct LifeCycle: App {
    let temp = GameManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(temp)
        }
    }
}
