import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var userMessageLabel: UILabel!
    
    private var model = Model.instance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /**
         // TODO: - Complete the following:
         -
         - Implement the missing methods in
         -- `UserDefaultsPersistence.swift`
         -- `FilePersistence.swift`
         -- `CoreDataPersistence.swift`
         - Inspect the functionality of each class listed above by changing the value of `persistenceMethod` below
         */
        
        let persistenceMethod: PersistenceMethod = .userDefaults
        let userMessage = "Hi! I am a string representing some value stored in \(persistenceMethod.rawValue)."

        // MARK: - Saving to Persistence
        
        model.save(userMessage: userMessage, to: persistenceMethod)
        
        // MARK: - Getting from Persistence
        
        userMessageLabel.text = model.retrieveUserMessage(from: persistenceMethod)
        
        // MARK: - Deleting from Persistence
        
        model.deleteUserMessageForAllMethods()
        PersistenceMethod.allCases.forEach {
            print(model.retrieveUserMessage(from: $0) ?? "User message for \($0.rawValue) does not exist")
        }
    }
}
