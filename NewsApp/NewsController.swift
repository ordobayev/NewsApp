//
//  NewsController.swift
//  NewsApp
//
//  Created by Нургазы on 23/2/21.
//

import UIKit
import WebKit

class NewsController: UIViewController {
    
    @IBOutlet var webview: WKWebView!
    
    var newsURL: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print(newsURL!)
        if let newsURL = newsURL, let url = URL(string: newsURL) {
            let urlRequest = URLRequest(url: url)
            webview.load(urlRequest)
            
        }
    }
    
    
    @IBAction func dismissPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
