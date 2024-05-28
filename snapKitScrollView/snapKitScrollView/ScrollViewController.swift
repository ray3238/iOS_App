import UIKit
import SnapKit
import Then

class ScrollViewController: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()
    let labelOne = UILabel().then {
        $0.textColor = .black
        $0.text = "안녕하세요1"
        $0.font = UIFont.boldSystemFont(ofSize: 70)
    }
    let labelTwo = UILabel().then {
        $0.textColor = .black
        $0.text = "안녕하세요2"
        $0.font = UIFont.boldSystemFont(ofSize: 70)
    }
    let labelThree = UILabel().then {
        $0.textColor = .black
        $0.text = "안녕하세요3"
        $0.font = UIFont.boldSystemFont(ofSize: 70)
    }
    let labelFour = UILabel().then {
        $0.textColor = .black
        $0.text = "안녕하세요4"
        $0.font = UIFont.boldSystemFont(ofSize: 70)
    }
    let labelFive = UILabel().then {
        $0.textColor = .black
        $0.text = "안녕하세요5"
        $0.font = UIFont.boldSystemFont(ofSize: 70)
    }
    let labelSix = UILabel().then {
        $0.textColor = .black
        $0.text = "안녕하세요6"
        $0.font = UIFont.boldSystemFont(ofSize: 70)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        [
            labelOne,
            labelTwo,
            labelThree,
            labelFour,
            labelFive,
            labelSix
        ].forEach {
            self.contentView.addSubview($0)
        }
        makeConstraints()
    }

    func makeConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
            $0.width.equalTo(scrollView.snp.width)
            $0.height.equalTo(1200)
        }
        labelOne.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.centerX.equalToSuperview()
        }
        labelTwo.snp.makeConstraints {
            $0.top.equalTo(labelOne.snp.bottom).offset(200)
            $0.centerX.equalToSuperview()
        }
        labelThree.snp.makeConstraints {
            $0.top.equalTo(labelTwo.snp.bottom).offset(200)
            $0.centerX.equalToSuperview()
        }
        labelFour.snp.makeConstraints {
            $0.top.equalTo(labelThree.snp.bottom).offset(200)
            $0.centerX.equalToSuperview()
        }
        labelFive.snp.makeConstraints {
            $0.top.equalTo(labelFour.snp.bottom).offset(200)
            $0.centerX.equalToSuperview()
        }
        labelSix.snp.makeConstraints {
            $0.top.equalTo(labelFive.snp.bottom).offset(200)
            $0.centerX.equalToSuperview()
        }
    }
}
