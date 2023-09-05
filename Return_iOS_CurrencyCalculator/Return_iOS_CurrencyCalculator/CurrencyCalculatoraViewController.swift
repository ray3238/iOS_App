import UIKit
import SnapKit
import Then
import Moya

class CurrencyCalculatoraViewController: UIViewController {
    ///////////////
    let countries: [String] = ["한국(KRW)", "미국(USD)", "필리핀(PHP)", "일본(JPY)"]
    
    
    let picker = UIPickerView()
    
    private let countryOfRemittancePickerTextField = UITextField().then {
        $0.text = "(나라 선택)"
    }
    /////////////
    private let currencyCalculatoraViewLabel = UILabel().then {
        $0.text = "환율 계산"
        $0.font = UIFont.systemFont(ofSize: 36)
    }
    private let countryOfRemittanceViewLabel = UILabel().then {
        $0.text = "송금국가"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    private let countryOfRemittanceButton = UIButton().then {
        $0.setTitle("미국(USD)", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    private let recipientCountryViewLabel = UILabel().then {
        $0.text = "수취국가"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    private let recipientCountryButton = UIButton().then {
        $0.setTitle("한국(KRW)", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    private let exchangeRateViewLabel = UILabel().then {
        $0.text = "환율"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    private let exchangeRateLabel = UILabel().then {
        $0.text = "1,302.05 KRW / USD"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    private let timeViewLabel = UILabel().then {
        $0.text = "조회시간"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    private let timeLabel = UILabel().then {
        $0.text = "2023-9-5 / 12:50:20"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    private let remittanceAmountViewLabel = UILabel().then {
        $0.text = "송금액"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    private let remittanceAmountTextField = UITextField().then {
        $0.placeholder = "USD를 입력해주세요."
        $0.textAlignment = .right
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.black.cgColor
    }
    private let remittanceAmountLabel = UILabel().then {
        $0.text = "USD"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    private let calculatoraButton = UIButton().then {
        $0.setTitle("환율 계산", for: .normal)
        $0.titleLabel!.font = UIFont.boldSystemFont(ofSize: 18)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configPickerView()
        self.calculatoraButton.addTarget(self, action: #selector(self.goAmountReceived), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        addSubView()
        setLayout()
    }
    
    func addSubView() {
        [
            currencyCalculatoraViewLabel,
            countryOfRemittanceViewLabel,
            //
            countryOfRemittanceButton,
            //
            recipientCountryButton,
            //
            recipientCountryViewLabel,
            exchangeRateViewLabel,
            exchangeRateLabel,
            timeViewLabel,
            timeLabel,
            remittanceAmountViewLabel,
            remittanceAmountTextField,
            remittanceAmountLabel,
            calculatoraButton,
            countryOfRemittancePickerTextField
        ].forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout() {
        currencyCalculatoraViewLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(104)
            $0.centerX.equalToSuperview()
        }
        countryOfRemittanceViewLabel.snp.makeConstraints {
            $0.top.equalTo(currencyCalculatoraViewLabel).inset(88)
            $0.left.equalToSuperview().inset(24)
        }
        //
//        countryOfRemittanceButton.snp.makeConstraints {
//            $0.top.equalTo(currencyCalculatoraViewLabel).inset(83)
//            $0.left.equalTo(countryOfRemittanceViewLabel).inset(255)
//        }
        //
        countryOfRemittancePickerTextField.snp.makeConstraints {
            $0.top.equalTo(currencyCalculatoraViewLabel).inset(83)
            $0.left.equalTo(countryOfRemittanceViewLabel).inset(255)
        }
        recipientCountryViewLabel.snp.makeConstraints {
            $0.top.equalTo(countryOfRemittanceViewLabel).inset(36)
            $0.left.equalToSuperview().inset(24)
        }
        //
        recipientCountryButton.snp.makeConstraints {
            $0.top.equalTo(countryOfRemittancePickerTextField).inset(36)
            $0.left.equalTo(recipientCountryViewLabel).inset(255)
        }
        //
        exchangeRateViewLabel.snp.makeConstraints {
            $0.top.equalTo(recipientCountryViewLabel).inset(36)
            $0.left.equalToSuperview().inset(24)
        }
        exchangeRateLabel.snp.makeConstraints {
            $0.top.equalTo(recipientCountryButton).inset(41)
            $0.left.equalTo(exchangeRateViewLabel).inset(175)
        }
        timeViewLabel.snp.makeConstraints {
            $0.top.equalTo(exchangeRateViewLabel).inset(36)
            $0.left.equalToSuperview().inset(24)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(exchangeRateLabel).inset(36)
            $0.left.equalTo(timeViewLabel).inset(175)
        }
        remittanceAmountViewLabel.snp.makeConstraints {
            $0.top.equalTo(timeViewLabel).inset(36)
            $0.left.equalToSuperview().inset(24)
        }
        remittanceAmountLabel.snp.makeConstraints {
            $0.top.equalTo(timeLabel).inset(36)
            $0.left.equalTo(remittanceAmountViewLabel).inset(300)
        }
        remittanceAmountTextField.snp.makeConstraints {
            $0.top.equalTo(timeLabel).inset(36)
            $0.left.equalTo(remittanceAmountViewLabel).inset(150)
            $0.right.equalTo(remittanceAmountLabel).inset(50)
        }
        calculatoraButton.snp.makeConstraints {
            $0.top.equalTo(remittanceAmountLabel).inset(161)
            $0.left.equalToSuperview().inset(130)
            $0.right.equalToSuperview().inset(131)
        }
    }
    
    @objc func goAmountReceivedClickedButton(_ sender: UIButton) {
        self.calculatoraButton.addTarget(self, action: #selector(self.goAmountReceived), for: .touchUpInside)
    }
    
    @objc func goAmountReceived() {
        print("실행됨")
        self.navigationController?.pushViewController(AmountReceivedViewController(), animated: true)
    }
}


// MARK: pickerViewExtension
extension CurrencyCalculatoraViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // delegate, datasource 연결 및 picker를 textfied의 inputview로 설정한다
    func configPickerView() {
        picker.delegate = self
        picker.dataSource = self
        countryOfRemittancePickerTextField.inputView = picker
    }
    // pickerview는 하나만
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // pickerview의 선택지는 데이터의 개수만큼
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    // pickerview 내 선택지의 값들을 원하는 데이터로 채워준다.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    // textfield의 텍스트에 pickerview에서 선택한 값을 넣어준다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.countryOfRemittancePickerTextField.text = self.countries[row]
    }
}
