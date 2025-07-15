import Foundation
import CoreData

/**
// TODO: - Create a `UserMessageEntity` in `Persistence.xcdatamodeld`, give it at `String` attribute called `message`
-
*/

final class CoreDataPersistence {
    /// A container that encapsulates the Core Data stack and handles creation of certain objects needed to perform tasks
    private let container: NSPersistentContainer
    /// Wrapper around `container.viewContext` to signify that the it __IS__ the context utilized by the main thread
    private var mainContext: NSManagedObjectContext { container.viewContext }
    
    init() {
        /// The name that will be used for the `PersistentContainer`
        /// __MUST__ be the same as an existing core data model
        let dataStoreName = "Persistence"
        
        /// Create the `PersistentContainer` from the core data model
        let container = NSPersistentContainer(name: dataStoreName)
        /// Load the `PersistentStores`
        container.loadPersistentStores {
            /// Ensure that no errors have been encountered
            if let error = $1 {
                fatalError("Unable to load \(dataStoreName) persistent stores: \(error)")
            }
        }
        
        self.container = container
    }
}

extension CoreDataPersistence: PersistenceProtocol {
    var userMessage: String? { fetchAll()?.first }
    
    func save(userMessage: String) {
        cleanSave(userMessage)
    }
    
    func deleteUserMessage() {
        removeAllUserMessageEntities()
    }
}

// MARK: - Tasks Performed on the ViewContext (aka Main Context)

extension CoreDataPersistence {
    private func fetchAll() -> [String]? {
        /**
         // TODO: - Implement this method to
         -
         - Create a `UserMessageEntity.fetchRequest()`
         - Initialize a property `context` using `mainContext`
         - Utilize `context.performAndWait { }` and `context.fetch()` to retrieve existing `UserMessageEntities`
         - Return the result of the fetch operation
         - Be sure to handle errors appropriately
         */
        return nil
    }
    
    private func cleanSave(_ userMessage: String) {
        /**
         // TODO: - Implement this method to
         -
         - Create a `UserMessageEntity.fetchRequest()`
         - Initialize a property `context` using `mainContext`
         - Utilize `context.performAndWait { }` and `context.fetch()` to retrieve existing `UserMessageEntities`
         - If no entities are returned, create a new one and insert it into `context`
         - Clean up/ modify all entities to conform to the current state of the `userMessage` data available
         - If the `context` property has changes, perform `context.save()`
         - Be sure to handle errors appropriately
         */
    }
    
    private func removeAllUserMessageEntities() {
        /**
         // TODO: - Implement this method to
         -
         - Create a `UserMessageEntity.fetchRequest()`
         - Initialize a property `context` using `mainContext`
         - Utilize `context.performAndWait { }` and `context.fetch()` to retrieve existing `UserMessageEntities`
         - Delete all resulting entities using `context.delete()`
         - If the `context` property has changes, perform `context.save()`
         - Be sure to handle errors appropriately
         */
    }
}

// MARK: - Background Tasks (aka thread safe asynchronous actions)

extension CoreDataPersistence {
    /**
     // TODO: - Time allowing: Implement Asynchronous versions of the above methods
     -
     - Implement background/ asynchronous versions of the above methods
     - Discuss instances when background tasks are preferable to performing work on the `viewContext` (i.e. the main thread)
     - Discuss the difference between:
     -- `func newBackgroundContext() -> NSManagedObjectContext`
     -- `func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void)`
     */
}
