import Foundation

final class UserDefaultsPersistence {
    /// Key utilized by `UserDefaults` when storing the `userMessage` `String` value
    private let userMessageKey = "userMessage"
    // Global singleton instance to be used in the activity
    private let userDefaults = UserDefaults.standard
}

extension UserDefaultsPersistence: PersistenceProtocol {
    var userMessage: String? {
        /**
        // TODO: - Access `userDefaults` to return a `String` value for the `userMessageKey` if it exists
        -
        */
        
        return nil
    }
    
    func save(userMessage: String) {
        /**
        // TODO: - Access `userDefaults` to set a `String` value for the `userMessageKey`
        -
        */
    }
    
    func deleteUserMessage() {
        /**
        // TODO: - Access `userDefaults` to remove a `String` object for the `userMessageKey` if one exists
        -
        */
    }
}
