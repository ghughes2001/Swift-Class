/// Abstract object used to illustrate concepts outlined in `Lecture.pdf`
class Person {
    /// Attribute used to identify an individual `Person` object
    let name: String
    
    /// Attribute to be used to illustrate concepts outlined in `Lecture.pdf
    var friend: Person?
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit { print("\(name) is being deinitialized") }
}
