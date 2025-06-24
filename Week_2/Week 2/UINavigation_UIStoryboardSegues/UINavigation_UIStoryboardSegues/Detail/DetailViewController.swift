import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet private weak var detailLabel: UILabel!
    
    var detail: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = detail
    }
    
    /**
     // TODO: - Add a `UIBarButtonItem` to the `NavigationItem` in `Detail.storyboard`
     -
     // TODO: - Create an `IBAction` `doneButtonTapped` here
     -
     // TODO: - When the action is triggered; Use the `navigationController` to pop `DetailViewController` off the navigation stack
     -
     */
}
