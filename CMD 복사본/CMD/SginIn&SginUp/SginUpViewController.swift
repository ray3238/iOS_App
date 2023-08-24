import UIKit
import SnapKit
import Then
import Alamofire

class SginUpViewController: UIViewController {
    var pwHideCount1 = 0
    var pwHideCount2 = 0
    
    private let sginUpLabel = UILabel().then {
        $0.text = "회원가입"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 50)
    }
    
    let scrollView = UIScrollView().then {
        $0.backgroundColor = .white
    }
    let contentView = UIView().then {
        $0.backgroundColor = .white
    }
    private let sginUpIDTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "아이디"
        $0.borderStyle = .none
        $0.backgroundColor = .clear
        $0.autocapitalizationType = .none
    }
    private let sginUpEmailTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "이메일"
        $0.borderStyle = .none
        $0.backgroundColor = .clear
        $0.autocapitalizationType = .none
    }
    private let sginUpPWTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "비밀번호"
        $0.autocapitalizationType = .none
        $0.isSecureTextEntry = true
    }
    
    //뜬 눈
    var sginUpPWHideClickedBtn: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
        let image = UIImage(systemName: "eye", withConfiguration: imageConfig)
        
        button.setImage(image, for: .normal)
        button.tintColor = .lightGray
        button.backgroundColor = .white
        return button
    }()
    /* : : : : : : : : :*/
    //뜬 눈
    var sginUpCheckPWHideClickedBtn: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
        let image = UIImage(systemName: "eye", withConfiguration: imageConfig)
        
        button.setImage(image, for: .normal)
        button.tintColor = .lightGray
        button.backgroundColor = .white
        return button
    }()
    /* : : : : : : : : :*/
    
    private let checkPWTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "비밀번호 확인"
        $0.autocapitalizationType = .none
        $0.isSecureTextEntry = true
    }
    private let nameTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "이름"
        $0.autocapitalizationType = .none
    }
    
    private let gradeTextField = UITextField().then {
        $0.textColor = .black
    }
    private let gradeLabel = UILabel().then {
        $0.text = "학년"
        $0.textColor = .black
    }
    
    private let schoolClassTextField = UITextField().then {
        $0.textColor = .black
    }
    private let schoolClassLabel = UILabel().then {
        $0.text = "반"
        $0.textColor = .black
    }
    
    private let classNumberTextField = UITextField().then {
        $0.textColor = .black
    }
    private let classNumberLabel = UILabel().then {
        $0.text = "번호"
        $0.textColor = .black
    }
    
    
    private let yearTextField = UITextField().then {
        $0.textColor = .black
    }
    private let yearLabel = UILabel().then {
        $0.text = "년"
        $0.textColor = .black
    }
    
    private let monthTextField = UITextField().then {
        $0.textColor = .black
    }
    private let monthLabel = UILabel().then {
        $0.text = "월"
        $0.textColor = .black
    }
    
    private let dayTextField = UITextField().then {
        $0.textColor = .black
    }
    private let dayLabel = UILabel().then {
        $0.text = "일"
        $0.textColor = .black
    }
    
    
    
    private let fieldOfStudyTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "전공분야"
        $0.autocapitalizationType = .none
    }
    private let majorClubTextField = UITextField().then {
        $0.textColor = .black
        $0.placeholder = "전공동아리"
        $0.autocapitalizationType = .none
    }
    
    let idUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let emailUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let pwUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let checkPWUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let nameUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let gradeUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let schoolClassUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let classNumberUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let yearUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let monthUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let dayUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let fieldOfStudyUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    let majorClubUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.lightGray // 밑줄 색상 설정
    }
    
    private let sginUpButton = UIButton().then {
        $0.backgroundColor = UIColor(named: "Main1")
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel!.font = UIFont.boldSystemFont(ofSize: 18)
        $0.layer.cornerRadius = 2
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 1.0
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 2
    }
    
    private let goSignInLabel = UILabel().then {
        $0.text = "계정이 있으신가요?"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    private let goSignInButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(UIColor.lightGray, for: .normal)
        $0.titleLabel!.font = UIFont.systemFont(ofSize: 12)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("2")
        view.backgroundColor = .white
        addSubView()
        scrollView.addSubview(contentView)
        contentViewAddSubView()
        setLayout()
        setLayoutUnderLine()
        self.navigationController?.navigationBar.isHidden = true;
        
        self.sginUpButton.addTarget(self, action: #selector(self.sginupViewShift), for: .touchUpInside)
        self.goSignInButton.addTarget(self, action: #selector(self.goSginInViewShift), for: .touchUpInside)
        self.sginUpPWHideClickedBtn.addTarget(self, action: #selector(self.pwHide1), for: .touchUpInside)
        self.sginUpCheckPWHideClickedBtn.addTarget(self, action: #selector(self.pwHide2), for: .touchUpInside)
    }
    
    //비번 부분 눈 깜박깜박하는 기능
    
    @objc func sginupViewShift() {
        // 회원가입 가능한 정보들을 확인
        guard let userID = sginUpIDTextField.text, !userID.isEmpty,
              let email = sginUpEmailTextField.text, !email.isEmpty,
              let password = sginUpPWTextField.text, !password.isEmpty,
              let username = nameTextField.text, !username.isEmpty,
              let grade = gradeTextField.text, !grade.isEmpty,
              let schoolClass = schoolClassTextField.text, !schoolClass.isEmpty,
              let classNumber = classNumberTextField.text, !classNumber.isEmpty,
              let year = yearTextField.text, !year.isEmpty,
              let month = monthTextField.text, !month.isEmpty,
              let day = dayTextField.text, !day.isEmpty,
              let fieldOfStudy = fieldOfStudyTextField.text, !fieldOfStudy.isEmpty,
              let majorClub = majorClubTextField.text, !majorClub.isEmpty else {
            // 하나 이상의 필수 입력 필드가 비어있는 경우
            print("필수 정보를 모두 입력해주세요.")
            let popupViewController = EmptyPopupViewController()
            popupViewController.modalPresentationStyle = .overCurrentContext
            self.present(popupViewController, animated: true, completion: nil)
            return
        }
        
        // 중복 아이디 확인 API 호출
        let baseUrl = "http://52.65.160.119:8080"
        let duplicateIDEndpoint = "\(baseUrl)/userId"
        
        if sginUpPWTextField.text == checkPWTextField.text {
            // 아이디 중복 확인
            let idParameters: [String: Any] = ["userId": userID]
            AF.request(duplicateIDEndpoint, method: .post, parameters: idParameters)
                .responseJSON { response in
                    switch response.result {
                    case .success(let data):
                        if let result = data as? [String: Any], let isDuplicate = result["isDuplicate"] as? Bool, isDuplicate {
                            // 아이디가 중복됨
                            print("아이디가 이미 존재합니다.")
                            let popupViewController = IdDuplicationPopupViewController()
                            popupViewController.modalPresentationStyle = .overCurrentContext
                            self.present(popupViewController, animated: true, completion: nil)
                            return
                        } else {
                            // 아이디 중복되지 않음, 회원가입 API 호출
                            let apiEndpoint = "\(baseUrl)/signup/student"
                            let parameters: [String: Any] = [
                                "userId": userID,
                                "password": password,
                                "username": username,
                                "userEmail": email,
                                "grader": grade,
                                "schoolClass": schoolClass,
                                "number": classNumber,
                                "majorType": fieldOfStudy,
                                "club": majorClub,
                                "year": year,
                                "month": month,
                                "day": day
                            ]
                            
                            AF.request(apiEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
                                .responseJSON { response in
                                    switch response.result {
                                    case .success(let data):
                                        // 회원가입 성공 처리
                                        print("회원가입 성공! 응답 데이터: \(data)")
                                        //이거 오류 메세지는 뜨는데 데이터베이스에는 들어가는듯. 상관 X
                                        self.navigationController?.pushViewController(SginInViewController(), animated: true)
                                    case .failure(let error):
                                        // 회원가입 실패 처리
                                        print("회원가입 실패! 오류: \(error.localizedDescription)")
                                    }
                                }
                        }
                        
                    case .failure(let error):
                        // 아이디 중복 확인 실패 처리
                        print("아이디 중복 확인 실패! 오류: \(error.localizedDescription)")
                    }
                }
        } else {
            let popupViewController = differentPWPopupViewController()
            popupViewController.modalPresentationStyle = .overCurrentContext
            self.present(popupViewController, animated: true, completion: nil)
            return
        }
    }
    func addSubView() {
        [
            sginUpLabel,
            scrollView,
            sginUpButton,
            goSignInLabel,
            goSignInButton
        ].forEach {
            view.addSubview($0)
        }
    }
    
    func contentViewAddSubView() {
        [
            sginUpIDTextField,
            sginUpEmailTextField,
            sginUpPWTextField,
            sginUpPWHideClickedBtn,
            checkPWTextField,
            sginUpCheckPWHideClickedBtn,
            nameTextField,
            gradeTextField,
            gradeLabel,
            schoolClassTextField,
            schoolClassLabel,
            classNumberTextField,
            classNumberLabel,
            yearTextField,
            yearLabel,
            monthTextField,
            monthLabel,
            dayTextField,
            dayLabel,
            fieldOfStudyTextField,
            majorClubTextField,
            idUnderlineView,
            emailUnderlineView,
            pwUnderlineView,
            checkPWUnderlineView,
            nameUnderlineView,
            gradeUnderlineView,
            schoolClassUnderlineView,
            classNumberUnderlineView,
            yearUnderlineView,
            monthUnderlineView,
            dayUnderlineView,
            fieldOfStudyUnderlineView,
            majorClubUnderlineView
        ].forEach {
            contentView.addSubview($0)
        }
    }
    func setLayout() {
        sginUpLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(110)
            $0.left.equalToSuperview().inset(50)
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(sginUpLabel).inset(122)
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(170)
        }
        contentView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.right.equalToSuperview()
            $0.left.equalToSuperview()
            $0.height.equalTo(970)
            $0.width.equalTo(360)
        }
        sginUpIDTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(30)
        }
        sginUpEmailTextField.snp.makeConstraints {
            $0.top.equalTo(sginUpIDTextField).inset(102)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(70)
        }
        sginUpPWTextField.snp.makeConstraints {
            $0.top.equalTo(sginUpEmailTextField).inset(102)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(70)
        }
        // 눈알 ::
        sginUpPWHideClickedBtn.snp.makeConstraints {
            $0.top.equalTo(sginUpPWTextField)
            $0.left.equalTo(sginUpPWTextField).inset(265)
        }
        // ::
        
        checkPWTextField.snp.makeConstraints {
            $0.top.equalTo(sginUpPWTextField).inset(102)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(70)
        }
        
        // 눈알 ::
        sginUpCheckPWHideClickedBtn.snp.makeConstraints {
            $0.top.equalTo(checkPWTextField)
            $0.left.equalTo(checkPWTextField).inset(265)
        }
        // ::
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(checkPWTextField).inset(102)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(30)
        }
        
        gradeTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField).inset(102)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalTo(gradeLabel).inset(80)
        }
        gradeLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField).inset(102)
            $0.left.equalTo(gradeTextField).inset(70)
            $0.right.equalTo(schoolClassTextField).inset(20)
        }
        
        schoolClassTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField).inset(102)
            $0.left.equalTo(gradeLabel).inset(40)
            $0.right.equalTo(schoolClassLabel).inset(70)
        }
        schoolClassLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField).inset(102)
            $0.left.equalTo(schoolClassTextField).inset(60)
            $0.right.equalTo(classNumberTextField).inset(20)
        }
        
        classNumberTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField).inset(102)
            $0.left.equalTo(schoolClassLabel).inset(25)
            $0.right.equalTo(classNumberLabel).inset(55)
        }
        classNumberLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField).inset(102)
            $0.left.equalTo(classNumberTextField).inset(70)
            $0.right.equalToSuperview().inset(20)
        }
        
        yearTextField.snp.makeConstraints {
            $0.top.equalTo(gradeTextField).inset(102)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalTo(yearLabel).inset(80)
        }
        yearLabel.snp.makeConstraints {
            $0.top.equalTo(gradeTextField).inset(102)
            $0.left.equalTo(gradeTextField).inset(70)
            $0.right.equalTo(monthTextField).inset(20)
        }
        
        monthTextField.snp.makeConstraints {
            $0.top.equalTo(gradeTextField).inset(102)
            $0.left.equalTo(yearLabel).inset(40)
            $0.right.equalTo(monthLabel).inset(70)
        }
        monthLabel.snp.makeConstraints {
            $0.top.equalTo(gradeLabel).inset(102)
            $0.left.equalTo(monthTextField).inset(60)
            $0.right.equalTo(dayTextField).inset(20)
        }
        
        dayTextField.snp.makeConstraints {
            $0.top.equalTo(gradeTextField).inset(102)
            $0.left.equalTo(monthLabel).inset(25)
            $0.right.equalTo(dayLabel).inset(55)
        }
        dayLabel.snp.makeConstraints {
            $0.top.equalTo(gradeTextField).inset(102)
            $0.left.equalTo(dayTextField).inset(70)
            $0.right.equalToSuperview().inset(20)
        }
        
        fieldOfStudyTextField.snp.makeConstraints {
            $0.top.equalTo(yearTextField).inset(102)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(30)
        }
        majorClubTextField.snp.makeConstraints {
            $0.top.equalTo(fieldOfStudyTextField).inset(102)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(30)
        }
        sginUpButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(800)
            $0.left.equalToSuperview().inset(85)
            $0.right.equalToSuperview().inset(85)
            $0.bottom.equalTo(goSignInLabel).inset(55)
        }
        goSignInLabel.snp.makeConstraints {
            $0.top.equalTo(sginUpButton).inset(55)
            $0.left.equalToSuperview().inset(130)
            $0.bottom.equalToSuperview().inset(30)
        }
        goSignInButton.snp.makeConstraints {
            $0.top.equalTo(sginUpButton).inset(65)
            $0.left.equalTo(goSignInLabel).inset(95)
            $0.bottom.equalToSuperview().inset(40)
        }
    }
    
    func setLayoutUnderLine() {
        idUnderlineView.snp.makeConstraints {
            $0.top.equalTo(sginUpIDTextField).inset(25)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(sginUpIDTextField).inset(-4)
        }
        emailUnderlineView.snp.makeConstraints {
            $0.top.equalTo(sginUpEmailTextField).inset(25)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(sginUpEmailTextField).inset(-4)
        }
        pwUnderlineView.snp.makeConstraints {
            $0.top.equalTo(sginUpPWTextField).inset(25)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(sginUpPWTextField).inset(-5)
        }
        checkPWUnderlineView.snp.makeConstraints {
            $0.top.equalTo(checkPWTextField).inset(25)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(checkPWTextField).inset(-5)
        }
        nameUnderlineView.snp.makeConstraints {
            $0.top.equalTo(nameTextField).inset(25)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(nameTextField).inset(-4)
        }
        
        gradeUnderlineView.snp.makeConstraints {
            $0.top.equalTo(gradeTextField).inset(25)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalTo(schoolClassUnderlineView).inset(100)
            $0.bottom.equalTo(gradeTextField).inset(-4)
        }
        schoolClassUnderlineView.snp.makeConstraints {
            $0.top.equalTo(gradeTextField).inset(25)
            $0.left.equalTo(gradeUnderlineView).inset(115)
            $0.right.equalTo(classNumberUnderlineView).inset(90)
            $0.bottom.equalTo(gradeTextField).inset(-4)
        }
        classNumberUnderlineView.snp.makeConstraints {
            $0.top.equalTo(gradeTextField).inset(25)
            $0.left.equalTo(schoolClassUnderlineView).inset(85)
            $0.right.equalToSuperview().inset(75)
            $0.bottom.equalTo(gradeTextField).inset(-4)
        }
        yearUnderlineView.snp.makeConstraints {
            $0.top.equalTo(yearTextField).inset(25)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalTo(monthUnderlineView).inset(100)
            $0.bottom.equalTo(yearTextField).inset(-4)
        }
        monthUnderlineView.snp.makeConstraints {
            $0.top.equalTo(yearTextField).inset(25)
            $0.left.equalTo(yearUnderlineView).inset(115)
            $0.right.equalTo(dayUnderlineView).inset(90)
            $0.bottom.equalTo(yearTextField).inset(-4)
        }
        dayUnderlineView.snp.makeConstraints {
            $0.top.equalTo(yearTextField).inset(25)
            $0.left.equalTo(monthUnderlineView).inset(85)
            $0.right.equalToSuperview().inset(75)
            $0.bottom.equalTo(yearTextField).inset(-4)
        }
        
        fieldOfStudyUnderlineView.snp.makeConstraints {
            $0.top.equalTo(fieldOfStudyTextField).inset(25)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(fieldOfStudyTextField).inset(-4)
        }
        majorClubUnderlineView.snp.makeConstraints {
            $0.top.equalTo(majorClubTextField).inset(25)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(31)
            $0.bottom.equalTo(majorClubTextField).inset(-4)
        }
    }
    
    @objc func pwHide1() {
        if pwHideCount1 == 0 {
            sginUpPWTextField.isSecureTextEntry = false;
            pwHideCount1 += 1
        } else {
            sginUpPWTextField.isSecureTextEntry = true;
            pwHideCount1 -= 1
        }
    }
    /* : : : : : : : : :*/
    
    //비번 확인 부분 눈 깜박깜박하는 기능
    @objc func pwHide2() {
        if pwHideCount2 == 0 {
            checkPWTextField.isSecureTextEntry = false;
            pwHideCount2 += 1
        } else {
            checkPWTextField.isSecureTextEntry = true;
            pwHideCount2 -= 1
        }
    }
    /* : : : : : : : : :*/
    
    @objc func goSginInViewShift() {
        // 여긴 그냥 로그인 창으로 이동
        self.navigationController?.pushViewController(SginInViewController(), animated: true)
    }
    @objc func sginUpClickedBtn(_ sender: UIButton) {
        self.sginUpButton.addTarget(self, action: #selector(self.sginupViewShift), for: .touchUpInside)
    }
    
    @objc func goSignInClickedBtn(_ sender: UIButton) {
        self.goSignInButton.addTarget(self, action: #selector(self.goSginInViewShift), for: .touchUpInside)
    }
    // 눈 깜박깜박 부분 버튼 기능
    @objc func sginUpPWHideClickedBtn(_ sender: UIButton) {
        self.sginUpPWHideClickedBtn.addTarget(self, action: #selector(self.pwHide1), for: .touchUpInside)
    }
    @objc func sginUpCheckPWHideClickedBtn(_ sender: UIButton) {
        self.sginUpCheckPWHideClickedBtn.addTarget(self, action: #selector(self.pwHide2), for: .touchUpInside)
    }
}
