import Foundation
import UIKit
import SnapKit

var studentNameLabel: [String] = []

class CollectionViewCustomCell: UICollectionViewCell {
    let identifier = "CollectionViewCustomCell"
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        print("7")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        // 이미지 뷰 생성
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}



//    let imageView: UIImageView = {
//        let aImageView = UIImageView()
//        aImageView.image = UIImage(named: "MainLogo")
//        aImageView.translatesAutoresizingMaskIntoConstraints = false
//        return aImageView
//    }()
//
//    func setupConstraints() {
//        addSubview(imageView)
//        imageView.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(30)
//            $0.centerX.equalToSuperview()
//        }
//    }
//}
