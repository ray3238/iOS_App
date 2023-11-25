import UIKit
import SnapKit
import Then


class ThirdViewController: UIViewController {
    var coordinator: Coordinator?

    let thirdLabel = UILabel().then {
        $0.text = "세번째 뷰"
        $0.textColor = .black
    }
    
    let secondButton = UIButton().then {
        $0.setTitle("second", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    let backButton = UIButton().then {
        $0.setTitle("Back", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(thirdLabel)
        view.addSubview(secondButton)
        view.addSubview(backButton)

        thirdLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(100)
        }
        
        secondButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(backButton).inset(40)
        }
        
        backButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        secondButton.addTarget(self, action: #selector(secondButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        print("SecondViewController")
    }

    @objc func secondButtonTapped() {
        coordinator?.goToSecondScreen()
    }
    
    @objc func backButtonTapped() {
        coordinator?.navigationController?.popViewController(animated: true)
    }
}
