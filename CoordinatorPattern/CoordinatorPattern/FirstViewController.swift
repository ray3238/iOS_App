import UIKit
import Then
import RxSwift
import RxCocoa

class FirstViewController: UIViewController {
    var coordinator: Coordinator?
    let disposeBag = DisposeBag()
    
    let firstLabel = UILabel().then {
        $0.text = "첫번째 뷰"
        $0.textColor = .black
    }
    
    let nextButton = UIButton().then {
        $0.setTitle("SecondView", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    let thirdButton = UIButton().then {
        $0.setTitle("thirdView", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        //        thirdButton.addTarget(self, action: #selector(thirdButtonTapped), for: .touchUpInside)
        
        view.addSubview(nextButton)
        view.addSubview(firstLabel)
        view.addSubview(thirdButton)
        
        firstLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(100)
        }
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        thirdButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nextButton).inset(30)
        }
        // Add constraints as needed
        
        clickedButton()
    }

    func clickedButton() {
        let thirdButtonTap = thirdButton.rx.tap.asObservable()
        let nextButtonTap = nextButton.rx.tap.asObservable()
        
        thirdButtonTap
            .subscribe(
                onNext: {
                    self.coordinator?.goToThirdScreen()
                }).disposed(by: disposeBag)
        
        nextButtonTap
            .subscribe(
                onNext: {
                    self.coordinator?.goToSecondScreen()
                }).disposed(by: disposeBag)
    }
    
//    @objc func nextButtonTapped() {
//        coordinator?.goToSecondScreen()
//    }
//    @objc func thirdButtonTapped() {
//        coordinator?.goToThirdScreen()
//    }
}
