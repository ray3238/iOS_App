import UIKit
import SnapKit
import Then

public final class BellTextField: UIStackView {
    private let imageView = UIImageView().then {
        $0.image = UIImage(systemName: "bell")
    }
    private let textField = UITextField()

    public init() {
        super.init(frame: .zero)
        self.spacing = 4
        self.axis = .horizontal
        self.layoutMargins = .init(top: 12, left: 16, bottom: 12, right: 16)
        self.isLayoutMarginsRelativeArrangement = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 12
        addView()
        setLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setPlaceholder(
        placeholder: String
    ) {
        self.textField.placeholder = placeholder
    }

    func addView() {
        [
            imageView,
            textField
        ].forEach(self.addArrangedSubview(_:))
    }

    func setLayout() {
        imageView.snp.makeConstraints {
            $0.height.width.equalTo(24)
        }

        textField.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
        }
    }
}
