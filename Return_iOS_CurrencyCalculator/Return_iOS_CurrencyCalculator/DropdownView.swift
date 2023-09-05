import UIKit
import SnapKit
import Then

// Dropdown 없이 어떻게 구현할까
// PickerView 로 한번 구현해보자

class DropdownView: UIView {

    private let KRWButton = UIButton().then {
        $0.setTitle("한국(KRW)", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    }
    private let USAButton = UIButton().then {
        $0.setTitle("미국(USA)", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    }
    private let JAPButton = UIButton().then {
        $0.setTitle("일본(JAP)", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    }
    private let PHPButton = UIButton().then {
        $0.setTitle("필리핀(PHP)", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    }
}
