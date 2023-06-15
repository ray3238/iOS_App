//
//  ViewController.swift
//  snapKitTableView
//
//  Created by 이태규 on 2023/06/12.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    
    let tableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(ViewControllerCell.self, forCellReuseIdentifier: "ViewControllerCell")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        self.view.addSubview(tableView)
        makeConstraints()
    }
    
    func makeConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CustomCell = tableView.dequeueReusableCell(withIdentifier: "ViewControllerCell", for: indexPath) as! ViewControllerCell
        
        
        return CustomCell
    }
}
