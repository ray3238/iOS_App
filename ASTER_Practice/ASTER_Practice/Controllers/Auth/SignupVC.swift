import UIKit
import SnapKit
import Then

//MARK: 폰트 이름
// Gwangyang-Sunshine-Regular
// Gwangyang-Sunshine-Bold

class SignupVC: UIViewController {
    
    let label = UILabel().then {
        $0.text = "회원가입"
        $0.textColor = .black
        $0.font = UIFont(name: "Gwangyang-Sunshine-Regular", size: 40)
    }
    let labelTwo = UILabel().then {
        $0.text = "회원가입"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 40)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("뷰 실행됨")
        // Do any additional setup after loading the view.
        
        view.addSubview(label)
        view.addSubview(labelTwo)
        
        labelTwo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(label).inset(100)
        }
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        cheakFont()
    }
    
    func cheakFont() {
        for family in UIFont.familyNames {
            print(family)
            for name in UIFont.fontNames(forFamilyName: family) {
                print(name)
            }
        }
    }
}
