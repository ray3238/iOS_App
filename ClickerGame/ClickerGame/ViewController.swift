import UIKit



//MARK:  어떤식이냐.
//MARK:  APi 연동으로 값을 가져와.
//MARK:  연동한 값을 어디 저장할 수 있는 곳에 append로 뒤부터 저장해
//MARK:  어디선가 불러와서 cell에 정보를 넣어
//MARK:  이럼 끝인데..
//MARK:  어떻게 하지..

struct aaList {
    var aList: [aa]
}

struct aa {
    var a: Int = 1
    var b: Int = 2
    var c: Int = 3
}

class ViewController: UIViewController {
    var status: Bool = false
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var joonnaLongLabel: UILabel!
    var num_list: [Int] = [3, 4, 5, 2, 1]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        joonnaLongLabel.text = "조온나 긴 라벨 조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨조온나 긴 라벨"
        joonnaLongLabel.numberOfLines = 1
        joonnaLongLabel.lineBreakMode = .byTruncatingTail
    }
    @IBAction func boolCheck(_ sender: Any) {
        bb()
        statusLabel.text = String(status)
    }
    @IBAction func clickMinusButton(_ sender: UIButton) {
        count.text = String(Int(count.text!)! - 1)
    }
    @IBAction func clickedPlusButton(_ sender: UIButton) {
        count.text = String(Int(count.text!)! + 1)
    }
    func bb() {
        status.toggle()
    }
}
