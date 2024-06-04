import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    private let helloTextField = BellTextField().then {
        $0.setPlaceholder(placeholder: "안녕하세요~")
    }
    private let byeTextField = BellTextField().then {
        $0.setPlaceholder(placeholder: "안녕히가세요~")
    }
    private let firstProjectButton = ProjectButton().then {
        $0.setText("첫번째")
    }
    private let secondProjectButton = ProjectButton().then {
        $0.setText("두번째")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setLayout()
    }

    func addView() {
        [
            helloTextField,
            byeTextField,
            firstProjectButton,
            secondProjectButton
        ].forEach { view.addSubview($0) }
    }

    func setLayout() {
        helloTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.trailing.equalToSuperview().inset(40)
        }

        byeTextField.snp.makeConstraints {
            $0.top.equalTo(helloTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(40)
        }

        firstProjectButton.snp.makeConstraints {
            $0.top.equalTo(byeTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(40)
        }

        secondProjectButton.snp.makeConstraints {
            $0.top.equalTo(firstProjectButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(40)
        }
    }
}

