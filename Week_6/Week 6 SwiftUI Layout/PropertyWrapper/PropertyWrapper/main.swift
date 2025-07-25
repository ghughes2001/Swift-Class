import Foundation

// MARK: Problem 1-------------------------------------------------------------

@propertyWrapper
struct Uppercased {
    // When resource changes
    var wrappedValue: String {
        didSet { // Property Observer
            wrappedValue = wrappedValue.uppercased()
        }
    }
    
    // Creating a resource
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.uppercased()
    }
}

struct Noun {
	@Uppercased var name: String
	var age: Int
}

var umsl = Noun(name: "umsl", age: 62)
print(umsl)
print(umsl.name)
// TODO: Print just the `name` property from the `umsl` variable.
// Note how it appears compared to printing the whole struct.




















// MARK: Problem 2-------------------------------------------------------------

// "Backing Store" "Memory-Backed"
@propertyWrapper struct UserDefaultsBacked<Value> {
    let key: String
    var storage: UserDefaults = .standard
    
    var wrappedValue: Value? {
        get { storage.value(forKey: key) as? Value }
        set { storage.setValue(newValue, forKey: key) }
    }
}

// TODO: Implement a struct with a single [String] property. When that property is set, it should persist the value to UserDefaults.

let dictionary = [
    "TODOs": ["Go to grocery store", "shave"]
]

struct Model {
	@UserDefaultsBacked<[String]>(key: "TODOs") var todos: [String]?
	@UserDefaultsBacked<Date>(key: "Alarm") var alarm: Date?
}

