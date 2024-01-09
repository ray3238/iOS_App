//
//  ViewController.swift
//  ClickerGame
//
//  Created by 이태규 on 2023/04/11.
//

import UIKit

class ViewController: UIViewController {
    var status: Bool = false
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var joonnaLongLabel: UILabel!
    var num_list: [Int] = [3, 4, 5, 2, 1]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        joonnaLongLabel.text = "조온나 긴 라벨 조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨"
        joonnaLongLabel.numberOfLines = 1
        joonnaLongLabel.lineBreakMode = .byTruncatingTail
    }
    @IBAction func boolCheck(_ sender: Any) {
        bb()
        statusLabel.text = String(status)
    }
    @IBAction func clickMinusButton(_ sender: UIButton) {
        count.text = String(Int(count.text!)! - 1)
    }
    @IBAction func clickedPlusButton(_ sender: UIButton) {
        count.text = String(Int(count.text!)! + 1)
    }
    func bb() {
        status.toggle()
    }
}
