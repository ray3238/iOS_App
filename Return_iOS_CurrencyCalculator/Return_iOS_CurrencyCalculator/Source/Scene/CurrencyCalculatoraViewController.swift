import Foundation
import UIKit
import SnapKit
import Then
import Moya

class CurrencyCalculatoraViewController: UIViewController {
    
    var count: Int = 0
    let amountReceivedViewController: AmountReceivedViewController? = nil
    
    let countries1: [String] = ["한국(KRW)", "미국(USD)", "필리핀(PHP)", "일본(JPY)"]
    let countries2: [String] = ["한국(KRW)", "미국(USD)", "필리핀(PHP)", "일본(JPY)"]
    let countriesMoney1: [String] = ["krw", "usd", "php", "jpy"]
    let countriesMoney2: [String] = ["krw", "usd", "php", "jpy"]
    
    let remittancePicker = UIPickerView()
    let recipientPicker = UIPickerView()
    
    private let countryOfRemittancePickerTextField = UITextField().then {
        $0.text = "(나라 선택)"
    }
    private let recipientCountryPickerTextField = UITextField().then {
        $0.text = "(나라 선택)"
    }
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
        $0.text = "1,302.05"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    private let exchangeRemittanceLabel = UILabel().then {
        $0.text = "KRW"
    }
    private let slashLabel = UILabel().then {
        $0.text = "/"
    }
    private let exchangeRecipientLabel = UILabel().then {
        $0.text = "USD"
    }
    private let timeViewLabel = UILabel().then {
        $0.text = "조회시간"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    private let dateLabel = UILabel().then {
        $0.text = "2023-09-05 /"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    private let timeLabel = UILabel().then {
        $0.text = "00:00:00"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    private let remittanceAmountViewLabel = UILabel().then {
        $0.text = "송금액"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    private let remittanceAmountTextField = UITextField().then {
        $0.placeholder = "USD를 입력해주세요"
        $0.textAlignment = .right
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.black.cgColor
    }
    private let remittanceAmountLabel = UILabel().then {
        $0.text = "USD"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    private let checkCurrencyButton = UIButton().then {
        $0.setTitle("환율 보기", for: .normal)
        $0.titleLabel!.font = UIFont.boldSystemFont(ofSize: 18)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
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
        textFieldSetting()
        configPickerView()
        self.calculatoraButton.addTarget(self, action: #selector(self.goAmountReceived), for: .touchUpInside)
        self.checkCurrencyButton.addTarget(self, action: #selector(self.checkCurrency), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        addSubView()
        setLayout()
    }
    
    func addSubView() {
        [
            currencyCalculatoraViewLabel,
            countryOfRemittanceViewLabel,
            countryOfRemittanceButton,
            recipientCountryButton,
            recipientCountryViewLabel,
            exchangeRateViewLabel,
            exchangeRateLabel,
            exchangeRemittanceLabel,
            slashLabel,
            exchangeRecipientLabel,
            timeViewLabel,
            dateLabel,
            timeLabel,
            remittanceAmountViewLabel,
            remittanceAmountTextField,
            remittanceAmountLabel,
            //
            checkCurrencyButton,
            //
            calculatoraButton,
            countryOfRemittancePickerTextField,
            recipientCountryPickerTextField,
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
        countryOfRemittancePickerTextField.snp.makeConstraints {
            $0.top.equalTo(currencyCalculatoraViewLabel).inset(83)
            $0.left.equalTo(countryOfRemittanceViewLabel).inset(255)
        }
        recipientCountryViewLabel.snp.makeConstraints {
            $0.top.equalTo(countryOfRemittanceViewLabel).inset(36)
            $0.left.equalToSuperview().inset(24)
        }
        recipientCountryPickerTextField.snp.makeConstraints {
            $0.top.equalTo(countryOfRemittancePickerTextField).inset(36)
            $0.left.equalTo(recipientCountryViewLabel).inset(255)
        }
        exchangeRateViewLabel.snp.makeConstraints {
            $0.top.equalTo(recipientCountryViewLabel).inset(36)
            $0.left.equalToSuperview().inset(24)
        }
        exchangeRateLabel.snp.makeConstraints {
            $0.top.equalTo(recipientCountryPickerTextField).inset(41)
            $0.left.equalTo(exchangeRateViewLabel).inset(120)
        }
        exchangeRemittanceLabel.snp.makeConstraints {
            $0.top.equalTo(recipientCountryPickerTextField).inset(41)
            $0.left.equalTo(exchangeRateLabel).inset(140)
        }
        slashLabel.snp.makeConstraints {
            $0.top.equalTo(recipientCountryPickerTextField).inset(41)
            $0.left.equalTo(exchangeRemittanceLabel).inset(39)
        }
        exchangeRecipientLabel.snp.makeConstraints {
            $0.top.equalTo(recipientCountryPickerTextField).inset(41)
            $0.left.equalTo(exchangeRemittanceLabel).inset(50)
        }
        timeViewLabel.snp.makeConstraints {
            $0.top.equalTo(exchangeRateViewLabel).inset(36)
            $0.left.equalToSuperview().inset(24)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(exchangeRateLabel).inset(36)
            $0.left.equalTo(timeViewLabel).inset(150)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(exchangeRateLabel).inset(36)
            $0.left.equalTo(dateLabel).inset(120)
        }
        remittanceAmountViewLabel.snp.makeConstraints {
            $0.top.equalTo(timeViewLabel).inset(36)
            $0.left.equalToSuperview().inset(24)
        }
        remittanceAmountLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel).inset(36)
            $0.left.equalTo(remittanceAmountViewLabel).inset(290)
        }
        remittanceAmountTextField.snp.makeConstraints {
            $0.top.equalTo(dateLabel).inset(36)
            $0.left.equalTo(remittanceAmountViewLabel).inset(140)
            $0.right.equalToSuperview().inset(80)
        }
        //
        checkCurrencyButton.snp.makeConstraints {
            $0.top.equalTo(remittanceAmountViewLabel).inset(40)
            $0.left.equalToSuperview().inset(24)
        }
        //
        calculatoraButton.snp.makeConstraints {
            $0.top.equalTo(remittanceAmountLabel).inset(161)
            $0.left.equalToSuperview().inset(130)
            $0.right.equalToSuperview().inset(131)
        }
    }
    
    @objc func goAmountReceivedClickedButton(_ sender: UIButton) {
        self.calculatoraButton.addTarget(self, action: #selector(self.goAmountReceived), for: .touchUpInside)
    }
    @objc func checkCurrencyClickedButton(_ sender: UIButton) {
        self.checkCurrencyButton.addTarget(self, action: #selector(self.checkCurrency), for: .touchUpInside)
    }
    
    @objc func checkCurrency() {
        guard let fromCurrency = CurrencyCountryInfo.shared.fromCurrency,
              let toCurrency = CurrencyCountryInfo.shared.toCurrency,
              !(fromCurrency.isEmpty || toCurrency.isEmpty)
        else {
            print("class 변수 비었다")
            return
        }
        
        switch toCurrency {
        case "krw":
            let provider = MoyaProvider<CurrencyCalculatorAPI>()
            provider.request(.CurrencyAPIKrw(fromCurrency: fromCurrency, toCurrency: toCurrency)) { res in
                switch res {
                case .success(let result):
                    switch result.statusCode {
                    case 200:
                        if let data = try? JSONDecoder().decode(ExchangeRateResponseKrw.self, from: result.data) {
                            DispatchQueue.main.async { [self] in
                                CurrencyCountry.shared.numberData = remittanceAmountTextField.text!
                                let decimalPlaces = 3 // 두 번째 자리에서 반올림하고자 함
                                
                                let multiplier = pow(10.0, Double(decimalPlaces))
                                let roundedUSD = round(data.krw * multiplier) / multiplier
                                print("\(data.date)")
                                print("\(roundedUSD)")
                                CurrencyCountry.shared.currency = String(roundedUSD)
                                
                                exchangeRateLabel.text = CurrencyCountry.shared.currency
                                dateLabel.text = data.date + " /"
                                
                                count += 1
                            }
                        } else {
                            print("파싱 실패!")
                        }
                    default:
                        print("API 요청 실패!")
                    }
                case .failure(let error):
                    print("\(error.localizedDescription)")
                }
            }
        case "jpy":
            let provider = MoyaProvider<CurrencyCalculatorAPI>()
            provider.request(.CurrencyAPIJpy(fromCurrency: fromCurrency, toCurrency: toCurrency)) { res in
                switch res {
                case .success(let result):
                    switch result.statusCode {
                    case 200:
                        if let data = try? JSONDecoder().decode(ExchangeRateResponseJpy.self, from: result.data) {
                            DispatchQueue.main.async { [self] in
                                CurrencyCountry.shared.numberData = remittanceAmountTextField.text!
                                let decimalPlaces = 3 // 두 번째 자리에서 반올림하고자 함
                                
                                let multiplier = pow(10.0, Double(decimalPlaces))
                                let roundedUSD = round(data.jpy * multiplier) / multiplier
                                print("\(data.date)")
                                print("\(roundedUSD)")
                                CurrencyCountry.shared.currency = String(roundedUSD)
                                
                                exchangeRateLabel.text = CurrencyCountry.shared.currency
                                dateLabel.text = data.date + " /"
                                
                                count += 1
                            }
                        } else {
                            print("파싱 실패!")
                        }
                    default:
                        print("API 요청 실패!")
                    }
                case .failure(let error):
                    print("\(error.localizedDescription)")
                }
            }
        case "usd":
            let provider = MoyaProvider<CurrencyCalculatorAPI>()
            provider.request(.CurrencyAPIUsd(fromCurrency: fromCurrency, toCurrency: toCurrency)) { res in
                switch res {
                case .success(let result):
                    switch result.statusCode {
                    case 200:
                        if let data = try? JSONDecoder().decode(ExchangeRateResponseUsd.self, from: result.data) {
                            DispatchQueue.main.async { [self] in
                                CurrencyCountry.shared.numberData = remittanceAmountTextField.text!
                                let decimalPlaces = 3 // 두 번째 자리에서 반올림하고자 함
                                
                                let multiplier = pow(10.0, Double(decimalPlaces))
                                let roundedUSD = round(data.usd * multiplier) / multiplier
                                print("\(data.date)")
                                print("\(roundedUSD)")
                                CurrencyCountry.shared.currency = String(roundedUSD)
                                
                                exchangeRateLabel.text = CurrencyCountry.shared.currency
                                dateLabel.text = data.date + " /"
                                
                                count += 1
                            }
                        } else {
                            print("파싱 실패!")
                        }
                    default:
                        print("API 요청 실패!")
                    }
                case .failure(let error):
                    print("\(error.localizedDescription)")
                }
            }
        case "php":
            let provider = MoyaProvider<CurrencyCalculatorAPI>()
            provider.request(.CurrencyAPIPhp(fromCurrency: fromCurrency, toCurrency: toCurrency)) { res in
                switch res {
                case .success(let result):
                    switch result.statusCode {
                    case 200:
                        if let data = try? JSONDecoder().decode(ExchangeRateResponsePhp.self, from: result.data) {
                            DispatchQueue.main.async { [self] in
                                CurrencyCountry.shared.numberData = remittanceAmountTextField.text!
                                let decimalPlaces = 3 // 두 번째 자리에서 반올림하고자 함
                                
                                let multiplier = pow(10.0, Double(decimalPlaces))
                                let roundedUSD = round(data.php * multiplier) / multiplier
                                print("\(data.date)")
                                print("\(roundedUSD)")
                                CurrencyCountry.shared.currency = String(roundedUSD)
                                
                                exchangeRateLabel.text = CurrencyCountry.shared.currency
                                dateLabel.text = data.date + " /"
                                
                                count += 1
                            }
                        } else {
                            print("파싱 실패!")
                        }
                    default:
                        print("API 요청 실패!")
                    }
                case .failure(let error):
                    print("\(error.localizedDescription)")
                }
            }
        default:
            break
        }
    }
    
    @objc func goAmountReceived() {
        if count == 0 {
            print("환율 확인 버튼을 눌러주세요")
        } else {
            self.navigationController?.pushViewController(AmountReceivedViewController(), animated: true)
            count = 0
        }
    }
}


// MARK: pickerViewExtension
extension CurrencyCalculatoraViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // delegate, datasource 연결 및 picker를 textfied의 inputview로 설정한다
    func configPickerView() {
        remittancePicker.delegate = self
        remittancePicker.dataSource = self
        
        recipientPicker.delegate = self
        recipientPicker.dataSource = self
        countryOfRemittancePickerTextField.inputView = remittancePicker
        recipientCountryPickerTextField.inputView = recipientPicker
    }
    // pickerview는 하나만
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // pickerview의 선택지는 데이터의 개수만큼
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == remittancePicker {
            return countries1.count
        } else if pickerView == recipientPicker {
            return countries2.count
        }
        return 0
    }
    // pickerview 내 선택지의 값들을 원하는 데이터로 채워준다.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == remittancePicker {
            return countries1[row]
        } else if pickerView == recipientPicker {
            return countries2[row]
        }
        return nil
    }
    // textfield의 텍스트에 pickerview에서 선택한 값을 넣어준다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == remittancePicker {
            self.countryOfRemittancePickerTextField.text = self.countries1[row]
            self.remittanceAmountLabel.text = self.countries1[row]
            self.exchangeRemittanceLabel.text = self.countriesMoney1[row]
            CurrencyCountryInfo.shared.fromCurrency = countriesMoney1[row]
            print(CurrencyCountryInfo.shared.fromCurrency)
        } else if pickerView == recipientPicker {
            self.recipientCountryPickerTextField.text = self.countries2[row]
            self.exchangeRecipientLabel.text = self.countriesMoney2[row]
            CurrencyCountryInfo.shared.toCurrency = countriesMoney2[row]
            print(CurrencyCountryInfo.shared.toCurrency)
        }
    }
}

extension CurrencyCalculatoraViewController: UITextFieldDelegate {
    func textFieldSetting() {
        countryOfRemittancePickerTextField.delegate = self
        recipientCountryPickerTextField.delegate = self
        countryOfRemittancePickerTextField.tintColor = .clear
        recipientCountryPickerTextField.tintColor = .clear
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            return false
    }
}
