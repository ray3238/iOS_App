import UIKit
import SnapKit
import Then

class ModalViewController: UIViewController {
    private let titleLabel = UILabel().then {
        $0.text = "Modal 뷰"
        $0.textColor = .black
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(titleLabel)

        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
