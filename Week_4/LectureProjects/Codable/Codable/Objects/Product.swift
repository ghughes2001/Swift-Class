import Foundation

/// Convenience `protocol` outlining shared attributes between the `Product` and `AlternativeProduct` `struct`s
protocol ProductProtocol: Codable {
    var name: String { get }
    var points: Int { get }
    var description: String? { get }
}

/**
 Object used to decode data from supplied `JSON` files
 
 Utilized in the following exercises:
 - ExerciseOne
 - ExerciseThree
 - ExerciseFour
 - ExerciseFive
 */
struct Product: ProductProtocol {
    let name: String
    let points: Int
    let description: String?
}

extension Product {
    /**
     Object used to construct custom `CodingKey` objects
     
     Utilized in the following exercises:
     - ExerciseFour
     - ExerciseFive
     */
    struct Key: CodingKey {
        let stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        let intValue: Int? = nil
        init?(intValue: Int) { return nil }
    }
}
