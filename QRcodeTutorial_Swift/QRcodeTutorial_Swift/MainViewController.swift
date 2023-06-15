//
//  ViewController.swift
//  QRCodeTutorial_Swift
//
//  Created by 이태규 on 2023/06/01.
//

import UIKit
import WebKit

class MainViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL (string: "https://www.naver.com")
                let requestObj = URLRequest(url: url!)
        webView.load(requestObj)
    }


}

