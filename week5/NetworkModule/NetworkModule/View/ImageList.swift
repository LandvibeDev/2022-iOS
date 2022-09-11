//
//  ImageList.swift
//  NetworkModule
//
//  Created by Kyungsoo Lee on 2022/09/06.
//

import SwiftUI

struct ImageList: View {
    @ObservedObject var viewModel: ImageFinder
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(viewModel.model.images) { imageInfo in
                NavigationLink {
                    ImageItem(imageInfo: imageInfo)
                } label: {
                    ImageItem(imageInfo: imageInfo)
                }
            }
        }
    }
}

struct ImageList_Previews: PreviewProvider {
    static var previews: some View {
        ImageList(viewModel: ImageFinder())
    }
}
