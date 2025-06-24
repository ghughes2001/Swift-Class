import UIKit

/**
 // TODO - Implement the following components in `Main.storyboard` before proceeding:
 -
 - Add a `UINavigationController`
 - Ensure the `UINavigationController` `Is Initial View Controller`
 - Set the the `Main View Controller Scene` as the `UINavigationController`'s `root view controller`
 - Add a `Storyboard Reference`
 - Ensure the `Storyboard Reference`'s `Storyboard` property is set to `Detail`
 - Connect a `Show` segue from the `Perform Automatic Segue` button to the `Storyboard Reference`, give it the identifier `automatic`
 - Connect a `Show` segue from the `Main View Controller Scene` to the `Storyboard Reference`, give it the identifier `manual`
*/

/// Convenience `enum` for managing the source of a triggered `UIStoryboardSegue`
enum SegueIdentifier: String {
    case automatic, manual
    
    /// Convenience text property for completing tasks outlined in `TODO` comments
    var detailText: String {
        switch self {
        case .automatic: return "This segue was triggered via Storyboard!"
        case .manual: return "This segue was triggered programmatically!"
        }
    }
}

final class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /**
         // TODO: - Implement this method to:
         -
         - Parse required objects to perform setup
         - Setup the destination `UIViewController` with the appropriate attributes
         */
    }
    
    @IBAction private func manualSegueButtonTapped(_ sender: UIButton) {
        /**
         // TODO: - Implement this method to perform a `UIStoryboardSegue` to `DetailViewController`
         -
         // TODO: - Utilize the `sender` object in `performSegue(withIdentifier:,sender:)` to pass custom attributes to `DetailViewController`
         -
         */
    }
}
