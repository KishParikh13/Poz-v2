//
//  WebView.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/14/21.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {

    func makeUIView(context: Context) -> WKWebView {
        WKWebView(frame: .zero)
    }

    func updateUIView(_ view: WKWebView, context: UIViewRepresentableContext<WebView>) {

        let request = URLRequest(url: URL(string: "https://my.spline.design/book-ea2f22e33a1c9a74d80aff61543e474a/")!)

        view.load(request)
    }
}
