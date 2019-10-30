//
//  WebViewController.swift
//  SustainableApp
//
//  Created by Masaki on 10/2/1 R.
//  Copyright © 1 Reiwa Sugita Masaki. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKUIDelegate {
    
    var webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.self.height - 50)
        view.addSubview(webView)
        
        
        let urlString = UserDefaults.standard.object(forKey: "url")
        let url = URL(string: urlString as! String)
        let request = URLRequest(url: url!)
        webView.load(request)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
