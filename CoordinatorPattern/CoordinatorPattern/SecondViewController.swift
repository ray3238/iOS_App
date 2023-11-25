import UIKit
import SnapKit
import Then


class SecondViewController: UIViewController {
    var coordinator: Coordinator?

    let secondLabel = UILabel().then {
        $0.text = "두번째 뷰"
        $0.textColor = .black
    }
    
    let backButton = UIButton().then {
        $0.setTitle("Back", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(secondLabel)
        view.addSubview(backButton)

        secondLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(100)
        }
        backButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        print("SecondViewController")
    }

    @objc func backButtonTapped() {
        coordinator?.navigationController?.popViewController(animated: true)
    }
}
