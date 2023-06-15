import UIKit

class ViewController: UIViewController {
    
    var cellName: String = "CustomCell"

    var responseData: MealModel? = nil

    @IBOutlet weak var mealTableView: UITableView!
    
    func requestGet(url: String) {
        guard let url = URL(string: url) else {
            print("Error: cannot create URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling GET")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            guard let output = try? JSONDecoder().decode(MealModel.self, from: data) else {
                print("Error: JSON Data Parsing failed")
                return
            }
            DispatchQueue.main.async {
                self.responseData = output
                self.mealTableView.reloadData()
            }
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealTableView.dataSource = self
        mealTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        requestGet(url: "https://school-api.xyz/api/high/G100000170?year=2023&month=5&date=15&allergy=hidden")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseData?.menu.first!.breakfast.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: cellName, for : indexPath) as! CustomCell
        customCell.label.text = responseData?.menu.first?.breakfast[indexPath.row]
        return customCell
    }
}
