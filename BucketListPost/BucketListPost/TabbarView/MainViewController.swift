//
//  ViewController.swift
//  BucketListPost
//
//  Created by 이태규 on 2023/06/16.
//

import UIKit

class MainViewController: UIViewController {
    let cellID: String = "PostCustomCell"
    
    @IBOutlet weak var postTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        postTableView.dataSource = self
        postTableView.delegate = self
    }


}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCustomCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PostCustomCell
        
        postCustomCell.selectionStyle = .none
        postCustomCell.profil_Image.image = UIImage(named: "Loopy")
        postCustomCell.profil_Name.text = "이태규"
        postCustomCell.profil_Job.text = "학생"
        postCustomCell.postTitle.text = "제 버킷리스트는요.."
        
        postCustomCell.layer.borderWidth = 1
        postCustomCell.layer.borderColor = UIColor.lightGray.cgColor
        
        return postCustomCell
    }
}
