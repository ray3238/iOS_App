import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    private let progressBar = UIProgressView(progressViewStyle: .default)
    
    let textLabel = UILabel().then {
        $0.text = "궁합률 60%!"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    var textField = UITextField().then {
        $0.placeholder = "숫자를 입력해주세요(1~100)"
        $0.borderStyle = .roundedRect // 보더 스타일 설정 (선택사항)
    }
    
    private let button = UIButton().then {
        $0.backgroundColor = .black
        $0.tintColor = UIColor.black
        $0.setTitle("게이지", for: .normal)
    }
    
    private let label = UILabel().then {
        $0.text = "60%"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 프로그래스 바를 추가합니다.
        progressBar.progressTintColor = .yellow
        progressBar.trackTintColor = .systemGray6
        view.addSubview(textLabel)
        view.addSubview(progressBar)
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(label)
        
        self.button.addTarget(self, action: #selector(self.progressBarClear), for: .touchUpInside)
        
        textLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(200)
        }
        progressBar.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.8) // 너비 조절
            $0.height.equalToSuperview().multipliedBy(0.05) // 높이 조절
        }
        textField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-50) // 세로 위치 조절
        }
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(50) // 세로 위치 조절
        }
        label.snp.makeConstraints {
            $0.top.equalTo(progressBar).inset(10)
            $0.centerX.equalTo(progressBar)
        }
        
        // ProgressBar의 끝 부분을 둥글게 설정
        progressBar.layer.cornerRadius = 10
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 10
        progressBar.subviews[1].clipsToBounds = true
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 원하는 진행률(0.0에서 1.0 사이)로 애니메이션과 함께 업데이트합니다.
        updateProgress(percentage: 0.6)
    }
    
    func updateProgress(percentage: Float) {
        UIView.animate(withDuration: 0.6) {
            self.progressBar.setProgress(percentage, animated: true)
        }
    }
    @objc func progressBarClear() {
        // textField의 텍스트를 가져오고, 실수로 변환합니다.
        if let text = textField.text, let percentage = Float(text) {
            // 원하는 진행률(0.0에서 1.0 사이)로 ProgressBar를 업데이트합니다.
            textLabel.text = "궁합률 \(String(percentage))%!"
            label.text = "\(String(percentage))%"
            updateProgress(percentage: percentage / 100.0)
        }
    }
}


