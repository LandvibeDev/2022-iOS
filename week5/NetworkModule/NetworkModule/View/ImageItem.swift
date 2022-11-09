//
//  ImageItem.swift
//  NetworkModule
//
//  Created by Kyungsoo Lee on 2022/09/11.
//

import SwiftUI

struct ImageItem: View {
    var imageInfo: ImageBox.ImageInfo
    var body: some View {
        VStack(alignment: .center) {
            Group {
                AsyncImage(url: URL(string: imageInfo.link)) { image in
                        image
                        .ImageModifier()
                } placeholder: {
                    Image(systemName: "paperplane.circle.fill")
                        .IconModifier()
                }
                .padding(20)
                Text(imageInfo.attributedTitle!).padding(EdgeInsets(top: 0, leading: 10, bottom: 50, trailing: 10))
            }
        }
    }
}

struct ImageItem_Previews: PreviewProvider {
    static var imageInfo = ImageBox.ImageInfo(ImageFinder.Response.ImageInfo(
        title: "나도 탑건 2018년 재개봉때 받은 굿즈올려봄 - 영화 카테고리",
        link: "https://img.theqoo.net/img/DteeL.jpg",
        thumbnail: "https://search.pstatic.net/sunny/?src=https://img.theqoo.net/img/DteeL.jpg&type=b150",
        sizeheight: "1200",
        sizewidth: "1200"
    ), id: 1)
    static var previews: some View {
        ImageItem(imageInfo: imageInfo)
    }
}
