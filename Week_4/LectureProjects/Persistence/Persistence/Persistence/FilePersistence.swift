import Foundation

final class FilePersistence {
    /// Default singleton instance to be used in the activity
    private let fileManager = FileManager.default
    /// The location of the stored data
    private let fileURL: URL
    
    init() {
        /// Create the `URL` to the file
        //swiftlint:disable:next force_try
        fileURL = try! fileManager
            .url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("UserMessage")
            .appendingPathExtension("txt")
    }
}

/**
// TODO: - Implement the following methods to get/set/remove a `userMessage` `String` value to/from this persistence approach
-
*/
extension FilePersistence: PersistenceProtocol {
    var userMessage: String? {
        /**
         // TODO: - Use a `String` initializer to
         -
         - Read the contents of `fileURL`
         - Return the resulting `String` object
         - Be sure to handle errors appropriately
         */
        return nil
    }
    
    func save(userMessage: String) {
        /**
         // TODO: - Write the contents of `userMessage` to the `fileURL`
         -
         - Perform this task atomically
         - Utilize `.utf8` encoding
         - Be sure to handle errors appropriately
         */

    }
    
    func deleteUserMessage() {
        /**
         // TODO: - Utilize `fileManager` to remove the file at the `fileUrl`
         -
         - Be sure to handle errors appropriately
         */
    }
}
