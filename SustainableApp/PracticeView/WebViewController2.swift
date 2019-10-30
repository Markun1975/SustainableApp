//
//  WebViewController2.swift
//  SustainableApp
//
//  Created by Masaki on 10/19/1 R.
//  Copyright © 1 Reiwa Sugita Masaki. All rights reserved.
//

import UIKit
import WebKit

class WebViewController2: UIViewController,WKUIDelegate {

    var webView2 = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()


        webView2.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.self.height - 50)
        view.addSubview(webView2)
        
        
        guard let urlString2 = UserDefaults.standard.string(forKey: "url2") else { return }
        let contentsString = URL(string: urlString2)
        let req = URLRequest(url: contentsString!)
        webView2.load(req)
        
        
        

    }


}
