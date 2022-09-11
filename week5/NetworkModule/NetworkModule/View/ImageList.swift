//
//  ImageList.swift
//  NetworkModule
//
//  Created by Kyungsoo Lee on 2022/09/06.
//

import SwiftUI

struct ImageList: View {
    @ObservedObject var viewModel: ImageFinder
    
    var body: some View {
        Section {
            ForEach(viewModel.model.images) { imageInfo in
                ImageItem(imageInfo: imageInfo)
            }
        }
    }
}

struct ImageList_Previews: PreviewProvider {
    static var previews: some View {
        ImageList(viewModel: ImageFinder())
    }
}
