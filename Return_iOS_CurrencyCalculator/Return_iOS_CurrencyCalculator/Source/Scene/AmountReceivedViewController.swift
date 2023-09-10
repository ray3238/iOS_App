import UIKit
import SnapKit
import Then
import Moya
import DropDown

class AmountReceivedViewController: UIViewController {
    
    private let amountReceivedViewLabel = UILabel().then {
        $0.text = "수취금액"
        $0.font = UIFont.systemFont(ofSize: 36)
    }
    private let amountReceivedLabel = UILabel().then {
        $0.text = "수취금액은"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    var exchangeRateViewNumberLabel = UILabel().then {
        $0.text = "1,302.05"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    let exchangeRateViewLabel = UILabel().then {
        $0.text = "입니다."
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        setLable()
    }

    override func viewDidLayoutSubviews() {
        addSubView()
        setLayout()
    }
    
    func setLable() {
        exchangeRateViewNumberLabel.text = String(Double(CurrencyCountry.shared.currency)! * Double(CurrencyCountry.shared.numberData)!)
    }
    
    func addSubView() {
        [
            amountReceivedViewLabel,
            amountReceivedLabel,
            exchangeRateViewNumberLabel,
            exchangeRateViewLabel
        ].forEach {
            view.addSubview($0)
        }
    }
    func setLayout() {
        amountReceivedViewLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(104)
            $0.left.equalToSuperview().inset(122)
            $0.right.equalToSuperview().inset(122)
        }
        amountReceivedLabel.snp.makeConstraints {
            $0.top.equalTo(amountReceivedViewLabel).inset(132)
            $0.left.equalToSuperview().inset(48)
        }
        exchangeRateViewNumberLabel.snp.makeConstraints {
            $0.top.equalTo(amountReceivedViewLabel).inset(132)
            $0.left.equalTo(amountReceivedLabel).inset(86)
        }
        exchangeRateViewLabel.snp.makeConstraints {
            $0.top.equalTo(amountReceivedViewLabel).inset(132)
            $0.left.equalTo(exchangeRateViewNumberLabel).inset(86)
        }
    }
}
