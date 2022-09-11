//
//  Image+Extension.swift
//  NetworkModule
//
//  Created by Kyungsoo Lee on 2022/09/12.
//

import SwiftUI

extension Image {
    func ImageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func IconModifier() -> some View {
        self
            .ImageModifier()
            .frame(maxWidth: 200)
            .foregroundColor(.blue.opacity(0.5))
    }
}
