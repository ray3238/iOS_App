import UIKit
import SnapKit
import Then
import SwiftyJSON
import Moya
import Alamofire

var authToken: String?

class SginInViewController: UIViewController{
    
    var pwHideCount = 0
    var userName: String = ""
    
    private let loginLabel = UILabel().then {
        $0.text = "로그인"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 50)
    }
    private let loginIDTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "아이디"
        $0.borderStyle = .none
        $0.backgroundColor = .clear
        $0.autocapitalizationType = .none
    }
    let IDUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    private let loginPWTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
        $0.autocapitalizationType = .none
    }
    let PWUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    
    private let loginUsernameTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "유저이름"
        $0.autocapitalizationType = .none
    }
    let usernameUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    
    //eye
    var loginPWHideClickedBtn: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
        let image = UIImage(systemName: "eye", withConfiguration: imageConfig)
        
        button.setImage(image, for: .normal)
        button.tintColor = .lightGray
        button.backgroundColor = .white
        return button
    }()
    
    
    private let loginClickedBtn = UIButton().then {
        $0.backgroundColor = UIColor(named: "Main1")
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel!.font = UIFont.boldSystemFont(ofSize: 18)
        $0.layer.cornerRadius = 2
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 1.0
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 2
    }
    private let goSignUpLabel = UILabel().then {
        $0.text = "계정이 없으신가요?"
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    private let goSignUpClickedBtn = UIButton().then {
        $0.setTitle("회원가입하기", for: .normal)
        $0.setTitleColor(UIColor.lightGray, for: .normal)
        $0.titleLabel!.font = UIFont.systemFont(ofSize: 12)
    }
    private let findPWLabel = UILabel().then {
        $0.text = "비밀번호를 까먹으셨나요?"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    private let findPWClickedBtn = UIButton().then {
        $0.setTitle("비밀번호찾기", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel!.font = UIFont.systemFont(ofSize: 12)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("1")
        view.backgroundColor = .white
        addSubView()
        setLayout()
        setLayoutUnderLine()
        checkAutoLogin()
        self.navigationController?.navigationBar.isHidden = true;
        self.goSignUpClickedBtn.addTarget(self, action: #selector(self.sginUpVCSwift), for: .touchUpInside)
        self.loginPWHideClickedBtn.addTarget(self, action: #selector(self.pwHide), for: .touchUpInside)
        self.loginClickedBtn.addTarget(self, action: #selector(self.MainVCSwift), for: .touchUpInside)
        self.findPWClickedBtn.addTarget(self, action: #selector(self.findPWSwift), for: .touchUpInside)
    }
    
    //**
    func saveTokens(accessToken: String, refreshToken: String, accessExpiredAt: String, refreshExpiredAt: String) {
        let defaults = UserDefaults.standard
        defaults.set(accessToken, forKey: "accessToken")
        defaults.set(refreshToken, forKey: "refreshToken")
        defaults.set(accessExpiredAt, forKey: "accessExpiredAt")
        defaults.set(refreshExpiredAt, forKey: "refreshExpiredAt")
    }
    
    func getAccessToken() -> String? {
        return UserDefaults.standard.string(forKey: "accessToken")
    }
    //**
    
    @objc func MainVCSwift() {
        guard let userId = loginIDTextField.text, let password = loginPWTextField.text else {
            return
        }
        login(userId: userId, password: password)
    }
    
    // MARK: MoyaAPI연결 **
    
    private func login(userId: String, password: String) {
        let provider = MoyaProvider<AuthAPI>(plugins: [MoyaLoggerPlugin()])
        provider.request(.login(userId: loginIDTextField.text!, userName: loginUsernameTextField.text!, password: loginPWTextField.text!)) { res in
            switch res {
            case .success(let result):
                switch result.statusCode {
                case 200: break
                    //뷰 이동
                default:
                    print(result.statusCode)
                }
            case .failure(let err):
                print("\(err.localizedDescription)")
            }
        }
    }
    
    // ***********
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func checkAutoLogin() {
        let baseURL = "http://52.65.160.119:8080"
        let loginURL = URL(string: "\(baseURL)/login/student")!
        // UserDefaults에서 사용자 정보를 가져옵니다.
        guard let username = UserDefaults.standard.string(forKey: "username"),
              let password = UserDefaults.standard.string(forKey: "password") else {
            // 저장된 사용자 정보가 없는 경우, 로그인 화면을 표시합니다.
            presentLoginScreen()
            return
        }
        
        // 저장된 사용자 정보로 로그인 요청을 보냅니다. (Alamofire 사용)
        let parameters: [String: String] = [
            "username": username,
            "password": password
        ]
        
        AF.request(loginURL, method: .post, parameters: parameters)
            .responseJSON { response in
                switch response.result {
                case .success:
                    // 로그인 성공 시, 다음 화면으로 이동합니다.
                    self.presentMainScreen()
                case .failure:
                    // 로그인 실패 시, 로그인 화면을 표시합니다.
                    self.presentLoginScreen()
                }
            }
    }
    
    func presentLoginScreen() { }
    func presentMainScreen() {
        navigationController?.pushViewController(SginInAfterTabBarController(), animated: true)
    }
    
    
    
    @objc func sginUpVCSwift() {
        print("shift sginUpView!")
        self.navigationController?.pushViewController(SginUpViewController(), animated: true)
    }
    
    @objc func pwHide() {
        if pwHideCount == 0 {
            loginPWTextField.isSecureTextEntry = false;
            pwHideCount += 1
        } else {
            loginPWTextField.isSecureTextEntry = true;
            pwHideCount -= 1
        }
    }
    @objc func findPWSwift() {
        self.navigationController?.pushViewController(TemporaryPasswordViewController(authToken: authToken!), animated: true)
    }
    
    func addSubView() {
        [
            loginLabel,
            loginIDTextField,
            loginPWTextField,
            loginPWHideClickedBtn,
            loginUsernameTextField,
            IDUnderlineView,
            PWUnderlineView,
            usernameUnderlineView,
            loginClickedBtn,
            goSignUpLabel,
            goSignUpClickedBtn,
            findPWLabel,
            findPWClickedBtn
        ].forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout() {
        loginLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(110)
            $0.left.equalToSuperview().inset(50)
        }
        loginIDTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel).inset(200)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(30)
        }
        loginPWTextField.snp.makeConstraints {
            $0.top.equalTo(loginIDTextField).inset(80)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(70)
        }
        loginPWHideClickedBtn.snp.makeConstraints {
            $0.top.equalTo(loginPWTextField)
            $0.left.equalTo(loginPWTextField).inset(320)
        }
        loginUsernameTextField.snp.makeConstraints {
            $0.top.equalTo(loginPWTextField).inset(80)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(30)
        }
        loginClickedBtn.snp.makeConstraints {
            $0.top.equalTo(PWUnderlineView).inset(200)
            $0.left.equalToSuperview().inset(35)
            $0.right.equalToSuperview().inset(35)
            $0.bottom.equalTo(goSignUpLabel).inset(32)
        }
        goSignUpLabel.snp.makeConstraints {
            $0.top.equalTo(loginClickedBtn).inset(64)
            $0.left.equalToSuperview().inset(132)
            $0.bottom.equalToSuperview().inset(240)
        }
        goSignUpClickedBtn.snp.makeConstraints {
            $0.top.equalTo(loginClickedBtn).inset(58)
            $0.left.equalTo(goSignUpLabel).inset(95)
            $0.bottom.equalToSuperview().inset(233)
        }
        findPWLabel.snp.makeConstraints {
            $0.top.equalTo(goSignUpLabel).inset(22)
            $0.left.equalToSuperview().inset(101)
        }
        findPWClickedBtn.snp.makeConstraints {
            $0.top.equalTo(goSignUpLabel).inset(16)
            $0.left.equalTo(findPWLabel).inset(126)
        }
    }
    
    func setLayoutUnderLine() {
        IDUnderlineView.snp.makeConstraints {
            $0.top.equalTo(loginIDTextField).inset(25)
            $0.left.equalToSuperview().inset(35)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(loginIDTextField).inset(-4)
        }
        PWUnderlineView.snp.makeConstraints {
            $0.top.equalTo(loginPWTextField).inset(25)
            $0.left.equalToSuperview().inset(35)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(loginPWTextField).inset(-5)
        }
        usernameUnderlineView.snp.makeConstraints {
            $0.top.equalTo(loginUsernameTextField).inset(25)
            $0.left.equalToSuperview().inset(35)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(loginUsernameTextField).inset(-4)
        }
    }
    @objc func loginBtn(_ sender: UIButton) {
        self.loginClickedBtn.addTarget(self, action: #selector(self.MainVCSwift), for: .touchUpInside)
    }
    @objc func goSginUpBtn(_ sender: UIButton) {
        self.goSignUpClickedBtn.addTarget(self, action: #selector(self.sginUpVCSwift), for: .touchUpInside)
    }
    @objc func loginPWHideBtn(_ sender: UIButton) {
        self.loginPWHideClickedBtn.addTarget(self, action: #selector(self.pwHide), for: .touchUpInside)
    }
    @objc func findPWBtn(_ sender: UIButton) {
        self.findPWClickedBtn.addTarget(self, action: #selector(self.findPWSwift), for: .touchUpInside)
    }
}
