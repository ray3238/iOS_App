import UIKit
import SnapKit
import Then

class ProjectButton: UIButton {
    private var labelText: String = ""

    public init() {
        super.init(frame: .zero)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setText(
        _ labelText: String
    ) {
        self.labelText = labelText
        self.configureUI()
    }

    private func configureUI() {
        var config = UIButton.Configuration.plain()
        config.title = self.labelText
        config.attributedTitle?.foregroundColor = .white
        config.contentInsets = .init(top: 16, leading: 12, bottom: 16, trailing: 12)

        self.configuration = config
        self.layer.cornerRadius = 12
        self.backgroundColor = .blue
    }
}
