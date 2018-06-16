//  WebViewController.swift
//  Copyright © 2018 Hursh Agrawal. All rights reserved.

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
  var webView: WKWebView!
  var cssString: String!

  override func loadView() {
    webView = WKWebView()
    webView.navigationDelegate = self
    view = webView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    if let path = Bundle.main.path(forResource: "bitbucket", ofType: "css") {
      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        let string = String(data: data, encoding: String.Encoding.utf8) as String!
        self.cssString = string?.replacingOccurrences(of: "\n", with: "")
      } catch {
        print("[ERROR] Could not find bitbucket.css")
      }
    }

    let url = URL(string: "https://bitbucket.org/dashboard/overview")
    webView.load(URLRequest(url: url!))
    webView.allowsBackForwardNavigationGestures = true
  }

  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    let js = "var style = document.createElement('style'); style.innerHTML = '\(cssString!)'; document.head.appendChild(style);"
    webView.evaluateJavaScript(js, completionHandler: nil)
  }
}

