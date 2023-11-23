import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class ViewController: UIViewController {

    private var timer: Timer?
    private var elapsedTime: TimeInterval = 0.0
    let disposeBag = DisposeBag()

    let label = UILabel().then {
        $0.text = "버튼이 클릭되었습니다."
        $0.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        $0.alpha = 0
    }
    let button = UIButton().then {
        $0.setTitle("버튼", for: .normal)
        $0.backgroundColor = .blue
        $0.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
    }

    private let timeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 48)
        $0.textAlignment = .center
        $0.textColor = .black
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(timeLabel)

        timeLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }

//        self.button.addTarget(self, action: #selector(self.clickedButton), for: .touchUpInside)

        startTimer()
        clickedButton()
    }

    func clickedButton() {
        // 버튼 클릭 이벤트를 관찰하는 Observable 생성
        let buttonTapObservable = button.rx.tap.asObservable()
        
        // 버튼 클릭 이벤트를 구독하여 라벨에 메시지 표시
        buttonTapObservable
            .subscribe(
                onNext: { [weak self] in
                    UIView.animate(withDuration: 0.5) {
                        self?.label.alpha = 1
                    } completion: { _ in
                        print("끝")
                    }
                    // 함수 등이 사용되어도 OK!
                })
                .disposed(by: disposeBag)
    }
    
//    func clickedButton() {
//        let buttonTabObservable = button.rx.tap.asObservable()
//        let disposeBag = disposeBag
//        buttonTabObservable
//            .subscribe(
//                onNext: {
//                    self.label.text = "버튼이 클릭되었습니다."
//                },
//                onError: { _ in self.label.text = "에러인데용?" },
//                onCompleted: { self.label.text = "작업 완료" },
//                onDisposed: { self.label.text = "구독 취소" }
//            )
//    }
    
    
    
//    @objc func clickedButton() {
//        sleep(3)
//        label.text = "버튼이 클릭되었습니다."
//    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] (_) in
            self?.updateTimeLabel()
        })
        RunLoop.current.add(timer!, forMode: .common)
    }

    private func updateTimeLabel() {
        elapsedTime += 0.01
        let minutes = Int(elapsedTime / 60)
        let seconds = Int(elapsedTime.truncatingRemainder(dividingBy: 60))
        let milliseconds = Int((elapsedTime * 100).truncatingRemainder(dividingBy: 100))
        let timeString = String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
        timeLabel.text = timeString
    }

//    @objc func sginUpCheckPWHideClickedBtn(_ sender: UIButton) {
//        self.button.addTarget(self, action: #selector(self.clickedButton), for: .touchUpInside)
//    }

}
