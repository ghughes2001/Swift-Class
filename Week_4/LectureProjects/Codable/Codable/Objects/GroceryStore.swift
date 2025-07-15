import Foundation

/**
 Object used to illustrate illustrate approaches to accessing nested `json` data
 
 Utilized in ExerciseThree. This object represents a client's abstraction of data
 returned from a service layer, or `ServiceGroceryStore`
 */
struct GroceryStore {
    let name: String
    let products: [Product]
}
