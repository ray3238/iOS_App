//
//  WhyBucketListViewController.swift
//  BucketListPost
//
//  Created by 이태규 on 2023/06/17.
//

import UIKit

class WhyBucketListViewController: UIViewController {

    var id1: String = ""
    var password1: String = ""
    var job1: String = ""
    
    @IBOutlet weak var whyLabel: UILabel!
    @IBOutlet weak var whyBucketListTextField: UITextField!
    @IBOutlet weak var signupClickedBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showData()
        // Do any additional setup after loading the view.
    }
    
    func showData() {
        print(id1)
        print(password1)
        print(job1)
        whyLabel.text = id1
    }
}
