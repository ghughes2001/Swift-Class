import Foundation

/**
 Object used to illustrate custom `encode` and `decode` functions pursuant to their resepctive `protocol`(s)
 
 Utilized in the following exercises:
 - ExerciseFour
 - ExerciseFive
 */
struct Inventory {
    let products: [Product]
    
    enum CodingKeys: CodingKey {
        case points, description
    }
}
