//
//  ImageItem.swift
//  NetworkModule
//
//  Created by Kyungsoo Lee on 2022/09/11.
//

import SwiftUI

struct ImageItem: View {
    var image: ImageBox.ImageInfo
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                AsyncImage(url: URL(string: String(image.link)))
                Text("\(image.link)")
                Image(image.link)
            }
        }
    }
}

//struct ImageItem_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageItem(image: ImageFinder().model.images[0])
//    }
//}
