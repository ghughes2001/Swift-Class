import Foundation

/**
 // EXERCISE: - Read Data from Arrays
 -
 - Complete the `exerciseOne()` method to decode the contents of `One.json` as an `[Product]`
 - Use the supplied `json` `Data` object
 - Use a `JSONDecoder` object
 - `print` the result to console
 - Do not alter `struct Product`
 */

func exerciseOne() throws {
    let json: Data = jsonProvider.contents(ofFile: .one)
    let decoder = JSONDecoder()
    let lectureExample = try decoder.decode([Product].self, from: json)
    print(lectureExample)
}
