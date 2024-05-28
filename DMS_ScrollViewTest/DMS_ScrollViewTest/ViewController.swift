import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()

    let heechanLabel = UILabel().then {
        $0.text = "씨씨찬이"
    }

    let jiminLabel = UILabel().then {
        $0.text = "지ㅣ지지민이"
    }

    let secLabel = UILabel().then {
        $0.text = "첫번째~"
    }

    let minLabel = UILabel().then {
        $0.text = "두번째~"
    }

    let hourLabel = UILabel().then {
        $0.text = "세번째"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubView()
        setLayout()
    }

    func addSubView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        [
            heechanLabel,
            jiminLabel,
            secLabel,
            minLabel,
            hourLabel
        ].forEach { contentView.addSubview($0) }
    }

    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
            $0.width.equalTo(scrollView.snp.width)
            $0.height.equalTo(1200)
        }

        heechanLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.centerX.equalToSuperview()
        }

        jiminLabel.snp.makeConstraints {
            $0.top.equalTo(heechanLabel.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
        }

        secLabel.snp.makeConstraints {
            $0.top.equalTo(jiminLabel.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
        }

        minLabel.snp.makeConstraints {
            $0.top.equalTo(secLabel.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
        }

        hourLabel.snp.makeConstraints {
            $0.top.equalTo(minLabel.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
        }
    }
}
