import Foundation

// TODO: - Try removing the default case. What error do you get?
// switch must be exhaustive

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let thing where thing.hasSuffix("pepper"):
    print("Is it a spicy \(thing)?")
default:
    print("Everything tastes good in soup.")
}

/*
 
Notice how let can be used in a pattern to assign the value that matched the pattern to a constant.

After executing the code inside the switch case that matched, the program exits from the switch statement. Execution doesn’t continue to the next case, so there is no need to explicitly break out of the switch at the end of each case’s code.
 
*/

// TODO: - Add another variable to keep track of which kind of number was the largest, as well as what that largest number was.

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largestKind = ""
var largest = 0
for (kind, numbers) in interestingNumbers {
    print("Assessing \(kind) numbers")
    for number in numbers {
        if number > largest {
            largest = number
            largestKind = kind
        }
    }
}
print("The largestkind is \(largestKind) and the largest number is \(largest)")

// TODO: - Add a color() method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds

enum Suit: String {
    case spades, hearts, diamonds, clubs
    
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        default:
            return "red"
        }
    }
}

// TODO: - Write a simple enum Error with cases for different types of errors that might occur in a program
enum Error {
    case unknown, fileNotFound, unAuthourized
}

// TODO: - Write a simple struct Person with at least a few properties like name, address, age, favorite food. Give it a description method or computed property which will print all the values in a sentence.
struct Person {
    var name : String
    var address : String
    var age: Int
    var favoriteFood: String
    
    func description() {
        print("My name is \(name), I live at \(address), I am \(age) years old and my favorite food is \(favoriteFood)")
    }
}

class Class {
    // self
}
enum Enum {
    func z() {
        switch (self) {
            
        }
    }
}
struct Struct {
    
}

// TODO: - Write a simple protocol for 'CanKick' defining a method 'kick()'
protocol CanKick {
    var isKicking: Bool {get set}
    
    func kick()
}

// TODO: - Write a class 'Ninja' which conforms to 'CanKick' protocol and has a couple other properties on it
class Ninja: CanKick {
    var isKicking: Bool = true
    
    func kick() {
        print("The ninja just kicked someone through the window!!")
    }
}
