import UIKit
import RxSwift
import SnapKit
import Then

class JokesListCell: UITableViewCell {
    let disposeBag = DisposeBag()
    
//    [
//        {
//            "type": "general",
//            "setup": "How do you steal a coat?",
//            "punchline": "You jacket.",
//            "id": 131
//        },
//    ]
    
    let questionLabel = UILabel().then {
        $0.text = ".."
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    
    let answerLabel = UILabel().then {
        $0.text = ".."
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .systemGray3
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        contentView()
        setLayout()
    }
    
    func contentView() {
        [
            questionLabel,
            answerLabel
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setLayout() {
        questionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        answerLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(questionLabel).inset(40)
        }
    }
    
    func setCell(jokesList: JokesListEntities) {
        questionLabel.text = jokesList.question
        answerLabel.text = jokesList.answer
    }.  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
