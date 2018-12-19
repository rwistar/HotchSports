//
//  NewsItemViewController.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 10/31/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import UIKit
import WebKit

class NewsItemViewControllerOLD: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webNewsItem: WKWebView!
    
    var myURLString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let urlString = myURLString {
            if let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                webNewsItem.load(request)
                
            }
        }
        
        webNewsItem.navigationDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        if navigationAction.request.url?.absoluteString == myURLString {
            decisionHandler(WKNavigationActionPolicy.allow)
        } else {
            decisionHandler(WKNavigationActionPolicy.cancel)
        }
    }
}
