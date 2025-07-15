import Foundation

/**
 // EXERCISE: - Change Key Names
 -
 - Write a `private enum CodingKeys` inside `struct AlternativeProduct`
 - Subclass the `enum` as `String` and `CodingKey`
 - Write cases for each property of `struct AlternativeProduct` in `CodingKeys`
 - Provide `rawValue`s for each case that correspond to the keys implemented in the `Two.json` file
 - Complete the `exerciseTwo()` method to decode the contents of `Two.json` as an `[AlternativeProduct]`
 - Use the supplied `json` `Data` object
 - Use a `JSONDecoder` object
 - `print` the result to consoleå
 */

struct AlternativeProduct: ProductProtocol, Decodable {
    let name: String
    let points: Int
    let description: String?
    
    /**
    // TODO: - Implement `CodingKeys` enum here

    */
    private enum CodingKeys: String, CodingKey {
        case name = "product_name"
        case points = "product_cost"
        case description
    }
}

func exerciseTwo() throws {
    /**
     // TODO: - Uncomment the `json` `Data` object and complete the method
     -
     */
    let json = jsonProvider.contents(ofFile: .two)
    let decoder = JSONDecoder()
    let products = try decoder.decode([AlternativeProduct].self, from: json)
    
    print(products)
    
}
