import UIKit
import SnapKit
import Then
import Moya

class LoginViewController: UIViewController {

    private let loginLabel = UILabel().then {
        $0.text = "로그인"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 50)
    }
    private let idTextField = UITextField().then {
        $0.placeholder = "아이디를 입력하세요"
    }
    private let pwTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력하세요"
    }
    private let userNameTextField = UITextField().then {
        $0.placeholder = "유저이름을 입력하세요."
    }
    private let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = UIColor.yellow
        $0.titleLabel!.font = UIFont.boldSystemFont(ofSize: 18)
        $0.layer.cornerRadius = 2
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 1.0
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 2
    }
    private let goSignup = UILabel().then {
        $0.text = "계정이 없으신가요?"
        $0.font = UIFont.boldSystemFont(ofSize: 17)
    }
    private let goSignupButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.backgroundColor = .white
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
    }

    
    func addSubview() {
        [
            loginLabel,
            idTextField,
            pwTextField,
            userNameTextField,
            loginButton,
            goSignup,
            goSignupButton,
            findPWLabel,
            findPWClickedBtn
        ].forEach {
            view.addSubview($0);
        }
        
    }
    
    func autoLayout() {
        
    }
}
