//
//  ThirdViewController.swift
//  NASAnewsFeed
//
//  Created by Karlis Cars on 23/11/2019.
//  Copyright © 2019 Karlis Cars. All rights reserved.
//

import UIKit
import WebKit

class ThirdViewController: UIViewController, WKNavigationDelegate {
    
    var urlString = String()

    @IBOutlet var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NASA WebKit"
        
        guard  let url = URL(string: urlString) else {
            return}
            
            webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true

        // Do any additional setup after loading the view.
    }
    
}
