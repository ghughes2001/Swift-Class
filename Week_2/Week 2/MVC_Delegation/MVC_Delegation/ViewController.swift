import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var label: UILabel!
    
    private var model: Model!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /**
         // TODO: - Instantiate `model` here
         -
         */
    }
    
    @IBAction private func buttonTapped(_ sender: UIButton) {
        model.doSomething()
    }
}

/**
 // TODO: - Conform `ViewController` to `ModelDelegate` here
 -
 */
