import UIKit
import SnapKit
import Then
import RxSwift
import Moya

class BaseVC: UIViewController, UIGestureRecognizerDelegate {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        addSubView()
        setLayout()
        bind()
    }
    
    func addSubView() { }
    func setLayout() { }
    func bind() { }
}

