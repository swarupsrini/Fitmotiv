//
//  WebView.swift
//  FitSync
//
//  Created by Sai Gurrapu on 1/17/21.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    // Input Parameter
    let showURL: String

    // Used as WebView(showURL: "https://www.apple.com")

    func makeUIView(context: Context) -> WKWebView  {
        WKWebView(frame: .zero)
    }

    // A WKWebView object displays interactive web content in a web browser within the app
    func updateUIView(_ webView: WKWebView, context: Context) {

        // Convert the showURL string value into a URL struct
        let urlStruct = URL(string: showURL)

        /*
         Convert the URL struct into a URLRequest struct.
         URLRequest is a URL load request that is independent of protocol or URL scheme.
         */
        let urlLoadRequest = URLRequest(url: urlStruct!)

        // Ask the webView object to display the web page for the given URL
        webView.load(urlLoadRequest)
    }

}
