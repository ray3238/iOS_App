import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    let label = UILabel().then {
        $0.text = "안녕하세요"
        $0.textColor = .red
    }
    let button = UIButton().then {
        $0.setTitle("asdf", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.green.cgColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(label)
        view.addSubview(button)

        label.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }

        button.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(label.snp.bottom).offset(30)
        }
    }
}

