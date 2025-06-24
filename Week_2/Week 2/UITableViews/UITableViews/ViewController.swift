import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label: UILabel!
}

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AstrologicalSign.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell")! as! CustomCell
        let sign = AstrologicalSign.allCases[indexPath.row]
        cell.icon.image = UIImage(named: sign.rawValue)
        cell.label?.text = sign.description
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
