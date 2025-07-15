import Foundation

/**
 // EXERCISE: - Merge Data from Different Depths: Part 1
 -
 // TODO: - Set breakpoints in the code below and discuss the approach utilized to decode `Four.json` as an `Inventory` object
 -
 */

extension Inventory: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Product.Key.self)
        
        products = try container.allKeys.map {
            let productContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: $0)
            let points = try productContainer.decode(Int.self, forKey: .points)
            let description = try productContainer.decodeIfPresent(String.self, forKey: .description)

            return Product(name: $0.stringValue, points: points, description: description)
        }
    }
}

func exerciseFour() throws {
    let json = jsonProvider.contents(ofFile: .four)
    print(try JSONDecoder().decode(Inventory.self, from: json))
}


/**
 This approach uses an initializer for decoding the json file ( init(from) ) and loops through the json types with container.allKeys
 */
