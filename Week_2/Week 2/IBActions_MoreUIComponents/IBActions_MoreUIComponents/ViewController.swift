import UIKit

final class ViewController: UIViewController {
    /**
     // TODO: - Add a `UIImageView` to `Main.storyboard`, connect it as an `IBOutlet` here
     -
     */
    @IBOutlet weak var myImage: UIImageView!
    
    @IBAction func buttonWasPressed(_ sender: UIButton) {
        sender.tintColor = .red
    }
    
    @IBAction func switchWasToggled(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        mySwitch.backgroundColor = .magenta
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImage.image = UIImage(named: "happy-guy")
        /**
         // TODO: - Extract the `UIImage` "happy-guy" from assets
         -
         // TODO: - Extract the `UIImage` "puppy" from the main Bundle
         -
         */
    }
    
    /**
     // TODO: - Add a `UIButton` to `Main.storyboard`, connect an `IBAction` to it here for `Touch Up inside`
     -
     // TODO: - Add a `UISwitch` to `Main.storyboard`, connect an `IBAction` to it here for `Value Changed`
     -
     // TODO: - For each action triggered: execute some update to the UI
     -
     // TODO: - Call the following function to see an example of reading a JSON file from the Bundle
     -
     */
    private func printExampleJson() {
        guard
            let url = Bundle.main.url(forResource: "example", withExtension: "json"),
            let fileContents = try? String(contentsOf: url)
        else { return }
        
        print(fileContents)
    }
}
