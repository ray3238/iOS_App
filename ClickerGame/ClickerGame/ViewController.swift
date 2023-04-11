//
//  ViewController.swift
//  ClickerGame
//
//  Created by 이태규 on 2023/04/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var count: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func clickMinusButton(_ sender: UIButton) {
        count.text = String(Int(count.text!)! - 1)
    }
    @IBAction func clickedPlusButton(_ sender: UIButton) {
        count.text = String(Int(count.text!)! + 1)
    }}
