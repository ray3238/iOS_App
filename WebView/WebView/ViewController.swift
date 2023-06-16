//
//  ViewController.swift
//  WebView
//
//  Created by 이태규 on 2023/06/16.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "https://www.naver.com/")
        let request = URLRequest(url: url!)
        
        webView.load(request)
    }


}

