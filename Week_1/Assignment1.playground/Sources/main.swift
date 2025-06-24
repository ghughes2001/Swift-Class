import Foundation

func explainFunctions(name: String) -> Void {

}

func explainFunctions(_ person: String) -> Void {

}

func explainFunctions(to person: String) -> Void {
    print("Hi \(person). This function's argument-label is different than it's argument name! It seems to read like plain-English, doesn't it?")
}
/// Problem 1. Explore Swift function-call syntax
///
/// Swift supports "function overloading" whereby multiple functions may have the same name, if the functions have different types.
/// Simply call all 3 of the above functions.
///
// TODO: Answer here.
explainFunctions(name: "Grant")
explainFunctions("Grant")
explainFunctions(to: "Hughes")

func login(username: String, password: String) -> Bool {
    return username == "neo" && password == "the1"
}
/// Problem 2. A login experience with terminal text I/O. Do not edit the above login function.
///
/// Make 2 Optional String variables, for a username and password.
/// Print a prompt, asking the user for their username, then for their password. Save the user input in your variables.
/// Use the built-in `readLine` function to take user input from the command-line.
/// if the login was successful (the `login` function returned `true`), then print "Welcome \(username)." otherwise, print "Incorrect credentials, try again."
///
/// Try using your program to "log in
// TODO: Answer here
var userName: String?
var userPassword: String?

print("What is your usersname?")
userName = readLine()

print("What is your password?")
userPassword = readLine()

if let username = userName, let password = userPassword {
    if login(username: username, password: password) {
        print("Welcome \(username)")
    }
    else {
        print("Incorrect credentials, try again.")
    }
}

/// Problem 3: Implement a guessing game.
///
/// Use the built-in `readLine` function to take user input from the command-line.
/// Do this in an infinite loop.
///
/// Convert the user's string into an integer by using the Int initializer.
/// For Example: `Int("0") // returns Optional(0)`
///
/// If the user's guess is:
/// - equal to the random number: exit the loop, and print a success message :)
/// - lower than the random number: print a hint for them to guess higher
/// - higher than the random number: print a hint for them to guess lower
let randomInt: Int = Int.random(in: 1...10)
// TODO: Answer here
while true {
    if let userInput = readLine() {
        if let guess = Int(userInput) {
            if guess > randomInt {
                print("Guess lower")
            } else if guess < randomInt {
                print("Guess higher")
            } else {
                print("CORRECT!!")
                break;
            }
        }
    }
}

// ! Force Unwrap
// ?? Nil coalescing
// guard
while true {
    guard let userInput = readLine(), let guess = Int(userInput) else {
        continue
    }
    
    if guess > randomInt {
        
    } else if guess < randomInt {
        
    } else {
        break
    }
}

class Person {
    let name: String
    let nickname: String?

    init(name: String, nickname: String?) {
        self.name = name
        self.nickname = nickname
    }
    
    func greet() {
        let message = nickname ?? name
        print("My name is \(message)")
    }
}
/// Problem 4: Getting familiar with OOP in Swift
///
/// Typically in an Object Oriented language, you "construct" instances of classes.
/// Swift calls constructors **initializers** _not constructors_.
/// Read the `init` method on the class `Person` to see how it works.
///
// TODO: Part 1
/// Comment out one line in the `init` function-body. Like the line: (self.name = name).
/// What is the compiler error? Explain what it means to you. (You may need to save/rebuild the file to see the error.)
/// Return from initializer without initializing all stored properties is the error
/// This mesans that I need to have all propties that I use to initialize the class be assigned to a value

// TODO: Part 2
/// Add a method (using `func`) to the `Person` which introduces the `Person` to the terminal user (using `print`).
/// The greeting should use the Person's nickname, if they have one, otherwise use their name.
/// Hint: This is a great use-case for the nil-coalescing operator `??`
///
/// Desired output:
/// ```
///   let mike = Person(name: "Michael", nickname: "Mike")
///   mike.greet()    // prints "Hey! I'm Mike."
///
///   let michael = Person(name: "Michael", nickname: nil)
///   michael.greet() // prints "Hey! I'm Michael."
/// ```
/// func greet()  {
//      let message = nickname ?? name
//      print("My name is \(message)")
//  }

// TODO: Part 3
/// Comment out your `greet` function-definition from Part 2, what is the compiler error? What does it mean?
/// i am not getting one
/// This means that swift cares about all the properties and what is being initialized

// TODO: Part 4
/// Call your `greet` method from Part 2 on the `maybePerson` constant below by using Optional Chaining `?.`
/// What happens when you run the code? Is the `greet` function called?
let maybePerson: Person? = nil // do not edit
maybePerson?.greet()
/// nothing gets printined to screen and i think it hangs
/// and yes

/// Problem 5: Exploring the Dictionary Type
///
/// Create an empty dictionary called "studentGrades" with String keys and Float values.
/// Add the following key-value pairs to the "studentGrades" dictionary:
///   Key: "John", Value: 85.5
///   Key: "Sarah", Value: 92.0
///   Key: "Michael", Value: 78.3
var studentGrades = [String: Float]()
studentGrades["John"] = 85.5
studentGrades["Sarah"] = 92.0
studentGrades["Michael"] = 78.3
/// Print the contents of the "studentGrades" dictionary.
print(studentGrades)
/// Access and print the grade for "Sarah".
if let gradeForSarah = studentGrades["Sarah"] {
    print(gradeForSarah)
}
/// Update John's grade to 90.0.
studentGrades["John"] = 90.0
/// Print the final contents of the "studentGrades" dictionary.
print(studentGrades)
/// Note that we can even separate the keys and values into individual "array-like" data structures by using the `keys` and `values` members on the `Dictionary` type.
/// Print all of the keys of `studentGrades` using the `keys` member. What is the data-type of the expression?
print(studentGrades.keys) // Dictionary<String, Float>.Keys

/// Problem 6. Exploring the Set Type
///
/// Create "setA" with the elements: 1, 2, 3, 4, 5.
let setA: Set<Int> = [1, 2, 3, 4, 5]
/// Create "setB" with the elements: 4, 5, 6, 7, 8.
let setB: Set<Int> = [4, 5, 6, 7, 8]
/// Use the "subtracting" method to find the elements in "setA" that do not exist in "setB".
/// Print the resulting Set.
print(setA.subtracting(setB))
/// How would you achieve the same output without a using the Set type? You don't need to include a complete solution, but rather an impression or pseudocode of how you'd do it.
/// 1) Create 2 empty arrays (A and B)
/// 2) Create an empty array C
/// 3)  Loop through array A and compare it to array B
/// 4) Add what is not the same (from array A) into array C
/// 5) Print array C
