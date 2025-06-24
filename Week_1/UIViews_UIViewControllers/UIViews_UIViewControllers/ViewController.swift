import UIKit

/**
 // TODO: - Click `Debug View Hierarchy` while running simulator to see a visual representation
 -
 */

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        /**
         // TODO: - Set a breakpoint on the following `print()` statements to illustrate when this function is called
         -
         */
        print(#function)
        print(view.frame)
        print(view.frame.origin)
        print(view.bounds)
        print(view.center)
        
        /**
         // TODO: - Add a `UIView` as an `IBOutlet` in `Main.storyboard` and repeat the previous TODO task replacing the `view` attribute with the name of the attached `IBOutlet`
         -
         */
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /**
         // TODO: - Set a breakpoint on the following `print()` statement to illustrate when this function is called
         -
         */
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /**
         // TODO: - Set a breakpoint on the following `print()` statement to illustrate when this function is called
         -
         */
        print(#function)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        /**
         // TODO: - Set a breakpoint on the following `print()` statement to illustrate when this function is called
         -
         */
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        /**
         // TODO: - Set a breakpoint on the following `print()` statement to illustrate when this function is called
         -
         */
        print(#function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        /**
         // TODO: - Set a breakpoint on the following `print()` statement to illustrate when this function is called
         -
         */
        print(#function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        /**
         // TODO: - Set a breakpoint on the following `print()` statement to illustrate when this function is called
         -
         */
        print(#function)
    }
}
