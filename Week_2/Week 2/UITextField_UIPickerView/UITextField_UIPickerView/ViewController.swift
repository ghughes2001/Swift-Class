import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /**
     The output of the following lines will loop over all of the view's subviews
     and invoke `resignFirstresponder()` on each of them
     `alt + click` on the function to see documentation
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
