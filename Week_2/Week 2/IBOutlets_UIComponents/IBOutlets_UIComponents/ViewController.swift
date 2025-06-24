import UIKit

class ViewController: UIViewController {
    /**
     // TODO: - Add and configure `UILabel` in `Main.storyboard`, connect it as an `IBOutlet` here. Name it `label`
     -
     */
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet var emptyOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = "123123123123"
        emptyOutlet.text = ""
        emptyOutlet.tintColor = .blue
        /**
         // TODO: - Experiment with altering the configuration of `label` programmatically here
         -
         */
    }
}
