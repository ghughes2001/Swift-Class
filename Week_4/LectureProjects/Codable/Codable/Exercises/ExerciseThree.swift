import Foundation

/**
 // EXERCISE: - Access Nested Data
 -
 - Examine the `Three.json` file to write the folowing structs:
 -- ServiceGroceryStore
 -- Aisle
 -- Shelf
 - Ensure each structure conforms to the `Decodable` `protocol`
 - Complete the `exerciseThree()` method below
 - Decode the contents of `Three.json` as an `[ServiceGroceryStore]`
 - Use __Map__ and __FlatMap__ to transform the decoded result to an `[GroceryStore]`
 - Use the supplied `json` `Data` object
 - Use a `JSONDecoder` object
 - `print` the result to console
 */

/**
 // TODO: - Implement the structures described above
 -
 - ServiceGroceryStore
 - Aisle
 - Shelf
 */

struct ServiceGroceryStore: Decodable {
    let name: String
    let aisles: [Aisle]
}

struct Aisle: Decodable {
    let name: String
    let shelves: [Shelf]
}

struct Shelf: Decodable {
    let name: String
    let products: [groceryProduct]
}

struct groceryProduct: Decodable {
    let name: String
    let points: Int
    let description: String?
}

struct GroceriesStore: CustomStringConvertible {
    let storeName: String
    let aisleName: String
    let shelfName: String
    let product: groceryProduct

    var description: String {
        return """
        Store: \(storeName)
        Aisle: \(aisleName)
        Shelf: \(shelfName)
        Product: \(product.name) - \(product.points) points - \(String(describing: product.description))
        """
    }
}


func exerciseThree() throws {
    /**
     // TODO: - Uncomment the `json` `Data` object and complete the method
     -
     // CHALLENGE: - Use `func map(_)` and `func flatMap(_)` to transform the service result's products into a single `Collection`
     -
     */
    let json = jsonProvider.contents(ofFile: .three)
    let decoder = JSONDecoder()
    let stores = try decoder.decode([ServiceGroceryStore].self, from: json)
    let products: [GroceriesStore] = stores.flatMap { store in store.aisles.flatMap { aisle in aisle.shelves.flatMap { shelf in shelf.products.map { product in GroceriesStore(storeName: store.name, aisleName: aisle.name, shelfName: shelf.name, product: product) }}}}
    products.forEach { print($0) }
}
