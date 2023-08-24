//
//  MainHomeViewController.swift
//  CMD
//
//  Created by 이태규 on 2023/07/11.
//

//로그인하면 탭바로 와야할지
//아니면 메인 화면으로 가야할지

import UIKit
import SnapKit
import Then

class BeforeMainHomeViewController: UIViewController {
    let MainLabel = UILabel().then {
        $0.text = "시간표"
        $0.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        $0.textColor = .white
    }
    let dateLabel = UILabel().then {
        $0.text = "2023년 07월 11일 화요일"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    let tableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(BeforeSubjectTableViewControllerCell.self, forCellReuseIdentifier: "BeforeSubjectTableViewControllerCell")
        $0.separatorStyle = .none
        $0.backgroundColor = UIColor(named: "Main1")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .red
        view.backgroundColor = UIColor(named: "Main1")
        print("4")
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
    }
    override func viewDidLayoutSubviews() {
        addSubView()
        makeConstraints()
    }
    func addSubView() {
        [
            MainLabel,
            dateLabel,
            tableView
        ].forEach({view.addSubview($0)})
    }
    
    func makeConstraints() {
        MainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.left.equalToSuperview().inset(60)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(MainLabel).inset(100)
            $0.left.equalToSuperview().inset(30)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(dateLabel).inset(20)
            $0.left.equalToSuperview().inset(13)
            $0.right.equalToSuperview().inset(13)
            $0.bottom.equalToSuperview().inset(90)
        }
    }
}

extension BeforeMainHomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "BeforeSubjectTableViewControllerCell", for: indexPath) as! BeforeSubjectTableViewControllerCell
        
        return customCell
    }
}
