import UIKit
import SnapKit
import Then
import Alamofire

class TemporaryPasswordViewController: UIViewController {

    let authToken: String
    
    let emailTextField = UITextField().then {
        $0.placeholder = "이메일 주소 입력"
        $0.borderStyle = .roundedRect
        $0.autocapitalizationType = .none
    }
    let getPasswordButton = UIButton().then {
        $0.setTitle("임시 비밀번호 받기", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.addTarget(TemporaryPasswordViewController.self, action: #selector(fetchTemporaryPassword), for: .touchUpInside)
    }
    
    init(authToken: String) {
            self.authToken = authToken
            super.init(nibName: nil, bundle: nil)
            fetchTemporaryPassword()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
        
    @objc private func fetchTemporaryPassword() {
        let temporaryPasswordURL = "http://52.65.160.119:8080/findPassword"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(authToken)"
        ]
        
        AF.request(temporaryPasswordURL, headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    // 서버로부터 데이터를 성공적으로 받아왔을 경우의 처리
                    if let json = data as? [String: Any],
                       let temporaryPassword = json["temporary_password"] as? String {
                        // 받아온 데이터로 모달 뷰에 표시
                        self.showAlert(title: "성공", message: "임시 비밀번호는 \(temporaryPassword) 입니다.")
//                        self.contentLabel.text = "임시 비밀번호: \(temporaryPassword)"
                    } else {
                        self.showAlert(title: "오류", message: "임시 비밀번호를 받아올 수 없습니다.")
                    }
                    
                case .failure(let error):
                    // 네트워크 오류 또는 서버 오류가 발생한 경우의 처리
                    self.showAlert(title: "오류", message: "네트워크 또는 서버 오류가 발생했습니다.")
                    print("Temporary password retrieval failed with error: \(error)")
                }
            }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(emailTextField)
        view.addSubview(getPasswordButton)
        
        emailTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-50)
            $0.width.equalToSuperview().multipliedBy(0.7)
        }
        
        getPasswordButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
        }
    }

}
