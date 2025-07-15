import Foundation

/// `enum` representing the various `JSON` files included in this activity
enum JSONFile: String {
    case one, two, three, four
    
    fileprivate var name: String { "\(rawValue.firstLetterUppercased).json" }
}


/// Convenience object for parsing the contents of a `.json` file into `Data`
struct JSONProvider {
    private let fileManager = FileManager.default
    private let path = (Bundle.main.infoDictionary?["JSONFilesDirectory"] as? String)!.replacingOccurrences(of: "\\", with: "")
    
    /**
     Parses the contents of a specified `JSONFile` case and returns them as `Data`
     
     - Parameters:
        - jsonFile: An `enum` representing the various `JSON` files included in this activity
     
     - Returns: The contents of a specified `JSONFile` parsed into `Data`
     */
    func contents(ofFile jsonFile: JSONFile) -> Data {
        return fileManager.contents(atPath: "\(path)/\(jsonFile.name)")!
    }
}

private extension String {
    var firstLetterUppercased: String { "\(first?.uppercased() ?? "")\(dropFirst())" }
}
