import UIKit
import Alamofire

class UserDataViewController: UIViewController {

    var UserDataCellId: String = "UserDataCell"
    
    
    var resultArr = UserDataEntity(results: [])
    
    @IBOutlet weak var tableView: UITableView!
    
    func getAPI() {
        let url = "https://randomuser.me/api/"
        
        AF.request(
            url,
            method: .get,
            headers: ["Content-Type":"application/json", "Accept":"application/json"]
        )
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            switch response.result {
            case .success(_):
                do{
                    let model = try JSONDecoder().decode(UserDataModel.self, from: response.data!)
                    model.results.forEach{
                        self.resultArr.results.append(ResultEntity(gender: $0.gender, name: NameEntity(title: $0.name.title, first: $0.name.first, last: $0.name.last)))
                    }
                    dump(self.resultArr)
                    self.tableView.reloadData()
                } catch {
                    print("catch")
                }
            case .failure(let error):
                print("error:", error)
            }
        }
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        getAPI()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
// Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        getAPI()
    }
    
}

extension UserDataViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArr.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let UserDataCell = tableView.dequeueReusableCell(withIdentifier: UserDataCellId, for: indexPath) as! UserDataCell
        
        let name = resultArr.results[indexPath.row].name
        let gender = resultArr.results[indexPath.row].gender
        UserDataCell.nameLabel.text = name.title + "." + name.first + " " + name.last
        UserDataCell.genderLabel.text = gender
        
        
        
        return UserDataCell
    }
}
