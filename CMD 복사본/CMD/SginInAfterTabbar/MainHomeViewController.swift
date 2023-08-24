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
import Alamofire

//struct TimetableData: Codable {
//    let PERIO: String
//    let ITRT_CNTNT: String
//    let GRADE: String
//    let CLASS_NM: String
//    let ALL_TI_YMD: String
//}
//struct TimetableResult: Decodable {
//    let hisTimetable: [HisTimetable]
//}
//
//struct HisTimetable: Decodable {
//    let row: [TimetableRow]
//}
//
//struct TimetableRow: Decodable {
//    let ITRT_CNTNT: String
//}

struct TimetableData {
    let period: String
    let content: String
}

class MainHomeViewController: UIViewController {
    
    var timetableData: [TimetableData] = []
    
    private let MainLabel = UILabel().then {
        $0.text = "시간표"
        $0.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        $0.textColor = .black
    }
    var dateLabel = UILabel().then {
        $0.text = "2023년 07월 4일 화요일"
        //        $0.textColor = .white
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    let tableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(SubjectTableViewControllerCell.self, forCellReuseIdentifier: "SubjectTableViewControllerCell")
        $0.separatorStyle = .none
        $0.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("4")
        // Do any additional setup after loading the view.
        
        fetchTimetable()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
    }

    private func fetchTimetable() {
            let apiURL = "https://open.neis.go.kr/hub/hisTimetable"
            let parameters: [String: Any] = [
                "TYPE": "json",
                "ATPT_OFCDC_SC_CODE": "G10",
                "SD_SCHUL_CODE": "7430310",
                "ALL_TI_YMD": "20230704",
                "KEY": "513aa74951a64b0793c9a0519e3e4bde",
                "GRADE": "1",
                "CLASS_NM": "2"
            ]
            
            AF.request(apiURL, parameters: parameters)
                .responseJSON { [weak self] response in
                guard let self = self else { return }
                switch response.result {
                case .success(let value):
                    if let json = value as? [String: Any],
                       let hisTimetable = json["hisTimetable"] as? [[String: Any]],
                       let rows = hisTimetable.last?["row"] as? [[String: Any]] {
                        self.parseTimetableData(rows: rows)
                    }
                case .failure(let error):
                    print("Error fetching timetable: \(error)")
                }
            }
        }
    
    private func parseTimetableData(rows: [[String: Any]]) {
            for row in rows {
                if let period = row["PERIO"] as? String,
                   let content = row["ITRT_CNTNT"] as? String {
                    let timetableEntry = TimetableData(period: period, content: content)
                    timetableData.append(timetableEntry)
                }
            }
            tableView.reloadData()
        }
    
    override func viewDidLayoutSubviews() {
        addSubView()
        setLayout()
    }
    func addSubView() {
        [
            MainLabel,
            dateLabel,
            tableView
        ].forEach({view.addSubview($0)})
    }
    func setLayout() {
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

extension MainHomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timetableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "SubjectTableViewControllerCell", for: indexPath) as! SubjectTableViewControllerCell

        let timetableEntry = timetableData[indexPath.row]
        customCell.subject.text = "\(timetableEntry.content)"
        customCell.numClass.text = "\(timetableEntry.period)교시"
        return customCell
    }
}
