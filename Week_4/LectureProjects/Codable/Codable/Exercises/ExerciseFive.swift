import Foundation

/**
 // EXERCISE: - Merge Data from Different Depths: Part 2
 -
 // TODO: - Set breakpoints in the code below and discuss the approach utilized to encode an `Inventory` object
 -
 */

extension Inventory: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Product.Key.self)

        try products.forEach {
            let nameKey = Product.Key(stringValue: $0.name)!
            var productContainer = container.nestedContainer(keyedBy: CodingKeys.self, forKey: nameKey)

            try productContainer.encode($0.points, forKey: .points)
            try productContainer.encode($0.description, forKey: .description)
        }
    }
}

func exerciseFive() throws {
    let inventory = Inventory(products: [
        .init(name: "Grapes", points: 230, description: "A mixture of red and green grapes."),
        .init(name: "Lemons", points: 2300, description: "An extra sour lemon.")
    ])
    let data = try JSONEncoder().encode(inventory)
    let dataString = String(data: data, encoding: .utf8)!
    print(dataString)
}

/*
 This method uses encode(to) to read a json file
 It also seems to be reading as a dictionary for an object with a name, points, and description
 */
