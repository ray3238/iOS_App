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
        let PostCustomCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PostCustomCell
        
        PostCustomCell.testLabel.text = "안녕하세요"
        
        return PostCustomCell
    }
    
    
}
