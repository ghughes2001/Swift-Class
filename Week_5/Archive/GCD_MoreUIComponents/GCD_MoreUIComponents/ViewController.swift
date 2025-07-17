import UIKit

final class ViewController: UIViewController {
    /**
     // TODO: - Add and constrain a `UIActivityIndicatorView` in `Main.storyboard` and connect it as an `IBOutlet` here
     -
     */
        
    override func viewDidLoad() {
        super.viewDidLoad()
        /**
         // TODO: - Implement a call to `UIActivityIndicatorView` `startAnimating()` here
         -
         Ensure the call is executed on the main thread
         -
         */
        mockAsyncTask {
            /**
             // TODO: - Fix the code to ensure updates to the UI in this block are executed on the main thread
             -
             // TODO: - Implement a call to `UIActivityIndicatorView` `stopAnimating()` here
             -
             Ensure the call is executed on the main thread
             -
             */
            self.view.backgroundColor = .blue
        }
    }
    
    /**
     Convenience function to simulate performing some threaded/ asynchronous task
     
     - Parameters:
        - completion: The block of code to be executed upon completion of this method's asynchronous task
     */
    private func mockAsyncTask(completion: @escaping () -> ()) {
        DispatchQueue(label: "Some async task").async {
            sleep(2)
            completion()
        }
    }
}
