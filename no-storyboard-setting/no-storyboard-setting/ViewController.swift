import UIKit

class ViewController: UIViewController {
    
    lazy var textField: UITextField = {
        var IDTextField = UITextField()
        
        IDTextField.translatesAutoresizingMaskIntoConstraints = false
        
        IDTextField.frame = CGRect(x: 100, y: 100, width: 200, height: 30)
        IDTextField.borderStyle = .roundedRect
        IDTextField.placeholder = "이메일을 입력해주세요"
        IDTextField.leftViewMode = UITextField.ViewMode.always
        
//        IDTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
//        IDTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        IDTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        IDTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        return IDTextField
    }()
    
    lazy var PWTextField: UITextField = {
        var PWTextField = UITextField()
        
        PWTextField.translatesAutoresizingMaskIntoConstraints = false
        
        PWTextField.frame = CGRect(x: 100, y: 100, width: 200, height: 30)
        PWTextField.borderStyle = .roundedRect
        PWTextField.placeholder = "비밀번호를 입력해주세요"
        PWTextField.leftViewMode = UITextField.ViewMode.always
        
        return PWTextField
    }()
    
    lazy var SigninButton: UIButton = {
        var SigninButton = UIButton()
        
        SigninButton.translatesAutoresizingMaskIntoConstraints = false
        
        SigninButton.frame = CGRect(x: 100, y: 100, width: 200, height: 30)
        SigninButton.backgroundColor = .orange
        SigninButton.layer.masksToBounds = true
        SigninButton.layer.cornerRadius = 20
        SigninButton.setTitle("로그인", for: .normal)
        
        return SigninButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.textField)
        idTextFieldAutoLayout()
        self.view.addSubview(self.PWTextField)
        pwTextFieldAutoLayout()
        self.view.addSubview(self.SigninButton)
        signinButtonAutoLayout()
    }
}
    
    
extension ViewController {
    func idTextFieldAutoLayout() {
//            self.textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            self.textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        textField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -700).isActive = true
    }
}

extension ViewController {
    func pwTextFieldAutoLayout() {
        PWTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        PWTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        PWTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        PWTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -600).isActive = true
    }
}


extension ViewController {
    func signinButtonAutoLayout() {
        SigninButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        SigninButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        SigninButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        SigninButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500).isActive = true
    }
}

    
    
    
    
    
    
    
    
    
    
//    let textLabel : UILabel = {
//        let text = UILabel()
//
//        text.text = "Hello No Storyboard Practice"
//        text.textColor = .systemBlue
//        text.translatesAutoresizingMaskIntoConstraints = false
//
//        return text
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .systemGray
//        self.view.addSubview(textLabel)
//
//        textLabelAutoLayout()
//    }
//
//
//}
//
//extension ViewController {
//    func textLabelAutoLayout() {
//        NSLayoutConstraint.activate([
//            self.textLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            self.textLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//        ])
//    }
//}

