import SnapKit
import Then
import UIKit

class CollectionViewController: UIViewController {
    let button = UIButton().then {
        $0.setTitle("남자", for: .normal)
        $0.backgroundColor = .systemPink
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(button)
        
        button.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(291)
//            $0.left.equalToSuperview().inset(52)
//            $0.right.equalToSuperview().inset(245)
//            $0.bottom.equalToSuperview().inset(400)
//            $0.top.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(63)
            $0.height.equalTo(27)
        }
    }
    
    
}
