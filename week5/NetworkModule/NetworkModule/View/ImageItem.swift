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

struct ImageItem_Previews: PreviewProvider {
    static var image = ImageBox.ImageInfo(ImageFinder.Response.ImageInfo(title: "자원입대 500% 늘린 영화 <탑건> 비하인드 스토리", link: "http://post.phinf.naver.net/MjAxODA4MjJfMjAw/MDAxNTM0OTI3Njc1Mjk0.daIupY-wEvNG9LoxCg7AOjLXydpmWHSKjM0RjhmnZ9Ag.FlHSqho2HkMY4WBB3dW9RZ30atPHIC6wCMSy7lt_k3Ig.JPEG/I-YpERuxNT8j5aTOrTlvlb0YIp7Q.jpg", thumbnail: "https://search.pstatic.net/common/?src=http://post.phinf.naver.net/MjAxODA4MjJfMjAw/MDAxNTM0OTI3Njc1Mjk0.daIupY-wEvNG9LoxCg7AOjLXydpmWHSKjM0RjhmnZ9Ag.FlHSqho2HkMY4WBB3dW9RZ30atPHIC6wCMSy7lt_k3Ig.JPEG/I-YpERuxNT8j5aTOrTlvlb0YIp7Q.jpg&type=b150", sizeheight: "1201", sizewidth: "1600"), id: 6)
    static var previews: some View {
        ImageItem(image: image)
    }
}
