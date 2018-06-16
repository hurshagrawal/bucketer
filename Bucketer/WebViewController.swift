//  WebViewController.swift
//  Copyright © 2018 Hursh Agrawal. All rights reserved.

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
  var webView: WKWebView!

  override func loadView() {
    webView = WKWebView()
    webView.navigationDelegate = self
    view = webView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let url = URL(string: "https://bitbucket.org/dashboard/overview")
    webView.load(URLRequest(url: url!))
    webView.allowsBackForwardNavigationGestures = true
  }

  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    let css = ""
    let js = "var style = document.createElement('style'); style.innerHTML = '\(css)'; document.head.appendChild(style);"
    webView.evaluateJavaScript(js, completionHandler: nil)
  }
}

