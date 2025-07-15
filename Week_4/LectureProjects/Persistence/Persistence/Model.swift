import Foundation

/// `enum` representing various methods of persisting data in iOS
enum PersistenceMethod: String, CaseIterable {
    case userDefaults = "User Defaults Persistence"
    case file = "File Persistence"
    case coreData = "CoreData Persistence"
}

/// Convenience protocol for declaring methods shared across all three persistence approaches
protocol PersistenceProtocol {
    var userMessage: String? { get }
    
    func save(userMessage: String)
    func deleteUserMessage()
}

/// Wrapper around the three persistence methods discussed during lecture
final class Model {
    private let userDefaultsPersistence: UserDefaultsPersistence
    private let filePersistence: FilePersistence
    private let coreDataPersistence: CoreDataPersistence
    
    init(userDefaultsPersistence: UserDefaultsPersistence, filePersistence: FilePersistence, coreDataPersistence: CoreDataPersistence) {
        self.userDefaultsPersistence = userDefaultsPersistence
        self.filePersistence = filePersistence
        self.coreDataPersistence = coreDataPersistence
    }

    /**
     Retrieves a `String` via the `PersistenceMethod` specified
     
     - Parameters:
        - persistenceMethod: An `enum` representing the method that should be used to save the `userMessage` `String`
     
     - Returns: A `String?` representation of the stored `userMessage` value from the `PersistenceMethod` specified
     */
    func retrieveUserMessage(from persistenceMethod: PersistenceMethod) -> String? {
        switch persistenceMethod {
        case .userDefaults: return userDefaultsPersistence.userMessage
        case .file: return filePersistence.userMessage
        case .coreData: return coreDataPersistence.userMessage
        }
    }
    
    /**
     Saves a `String` via the `PersistenceMethod` specified
     
     - Parameters:
        - userMessage: The `String` to be saved
        - persistenceMethod: An `enum` representing the method that should be used to save the `userMessage` `String`
     */
    func save(userMessage: String, to persistenceMethod: PersistenceMethod) {
        switch persistenceMethod {
        case .userDefaults: userDefaultsPersistence.save(userMessage: userMessage)
        case .file: filePersistence.save(userMessage: userMessage)
        case .coreData: coreDataPersistence.save(userMessage: userMessage)
        }
    }
    
    /// Deletes stored `userMessage`(s) across all persistence methods
    func deleteUserMessageForAllMethods() {
        userDefaultsPersistence.deleteUserMessage()
        filePersistence.deleteUserMessage()
        coreDataPersistence.deleteUserMessage()
    }
}

extension Model {
    /**
     Creates and returns a `Model` object
     
     Serves the same function as a `convenience init`
     */    
    static func instance() -> Model {
        return Model(
            userDefaultsPersistence: UserDefaultsPersistence(),
            filePersistence: FilePersistence(),
            coreDataPersistence: CoreDataPersistence()
        )
    }
}
