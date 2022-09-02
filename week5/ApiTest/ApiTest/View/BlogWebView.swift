//
//  BlogWebView.swift
//  ApiTest
//
//  Created by 임주민 on 2022/09/02.
//

import SwiftUI
import WebKit

struct BlogWebView: UIViewRepresentable {
  
  var urlToLoad: String
  
  func makeUIView(context: Context) -> WKWebView {
    guard let url = URL(string: self.urlToLoad)
    else { return WKWebView() }
    let webView = WKWebView()
    webView.load(URLRequest(url: url))
    return webView
  }
  
  func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<BlogWebView>) {
  }
}
