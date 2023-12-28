import UIKit
import RxCocoa
import RxSwift
import SnapKit
import Then
import Moya

class JokesListView: BaseVC, UITableViewDelegate {

    private let jokesListViewModel = JokesListViewModel()
    var jokesListEntities: [JokesListEntities] = []
    private let tableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(JokesListCell.self, forCellReuseIdentifier: "JokesListCell")
        $0.separatorStyle = .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
    }

    override func addSubView() {
        [
            tableView
        ].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview().inset(90)
        }
    }
    
    override func bind() {
        let boolValue: Bool = true
        let input = JokesListViewModel.Input(
            bool: Driver.just(boolValue)
        )
        let output = jokesListViewModel.transform(input)
        output.result.subscribe(onNext: { _ in
            print("출력 빵빵")
        }).disposed(by: disposeBag)
        output.jokesListEntities.subscribe(onNext: { jokesListEntities in
            self.jokesListEntities = jokesListEntities
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
}

extension JokesListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("cell 갯수: ", jokesListEntities.count as Any)
        return jokesListEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "JokesListCell", for: indexPath) as! JokesListCell
        let jokesList = jokesListEntities[indexPath.row]
        
        customCell.setCell(jokesList: jokesList)
        return customCell
    }
}
