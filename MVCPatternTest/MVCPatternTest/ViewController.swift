import UIKit
import SnapKit
import Then

// 이 View에서 보여지는 UserTableViewCell, TableView는 View에 해당하고.
// 그 외의 나머지는 Controller에 해당한다.
class UserTableViewCell: UITableViewCell {
    static let identifier = "UserTableViewCell"

    let nameLabel = UILabel().then {
        $0.text = "-"
    }
    let ageLabel = UILabel().then {
        $0.text = "-"
    }
    let jobLabel = UILabel().then {
        $0.text = "-"
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        setLayout()
    }

    func addView() {
        [
            nameLabel,
            ageLabel,
            jobLabel
        ].forEach { contentView.addSubview($0) }
    }

    func setLayout() {
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(10)
        }

        ageLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(10)
        }

        jobLabel.snp.makeConstraints {
            $0.top.equalTo(ageLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(10)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    private let userTableView = UITableView().then {
        $0.register(
            UserTableViewCell.self,
            forCellReuseIdentifier: UserTableViewCell.identifier
        )
        $0.rowHeight = 100
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.delegate = self
        userTableView.dataSource = self
        view.addSubview(userTableView)

        userTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    var users: [User] = [
        User(name: "이봉구", age: 15, job: "student"),
        User(name: "dlxorb", age: 15, job: "developer"),
        User(name: "jack", age: 15, job: "student"),
        User(name: "예술가", age: 15, job: "artist")
    ]
//    let users: [User] = [
//        User(name: "이봉구", age: 15, job: "student"),
//        User(name: "dlxorb", age: 15, job: "developer"),
//        User(name: "jack", age: 15, job: "student"),
//        User(name: "예술가", age: 15, job: "artist")
//    ]
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return users.count
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = users[indexPath.row].name
        cell.ageLabel.text = "\(users[indexPath.row].age)"
        cell.jobLabel.text = users[indexPath.row].job
//        cell.nameLabel.text = users.name
//        cell.ageLabel.text = "\(users.age)"
//        cell.jobLabel.text = users.job
        return cell
    }
}
