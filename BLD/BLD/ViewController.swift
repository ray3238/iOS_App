//
//  ViewController.swift
//  BLD
//
//  Created by 이태규 on 2023/06/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorTextView: UITextView!
    @IBOutlet weak var colorButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        colorTextView.backgroundColor = UIColor(displayP3Red: 255/255, green: 166/255, blue: 84/255, alpha: 1)
        colorButton.backgroundColor = UIColor(displayP3Red: 255/255, green: 207/255, blue: 94/255, alpha: 1)
    }


}

