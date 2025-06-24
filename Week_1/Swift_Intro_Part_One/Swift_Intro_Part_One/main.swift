import Foundation

// TODO: - Option-Click implicitExample to see its inferred type
// let implicitExample: String

let implicitExample = "An implictly declared String"

// TODO: - Create a constant with an explicit type of Float and a value of 4
let value : Float = 4

// TODO: - What is the name for the method that combines two or more String objects by use of the + operator?
// string concatenation

// TODO: - Declare a constant with your name and another constant with your age. Create a single String constant with a message containing your name and age. Something like: "My name is Susie, and I am 23 years old."
let name = "Grant"
let age = 24
let message = "My name is \(name), an I am \(age)b years old."
 
// TODO: - Try removing the conversion to String from widthLabel. What error do you get?
// Binary operator '+' cannot be applied to operands of type 'String' and 'Int'

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

// TODO: - Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting
let calculation: Float = 76.0 * 32.358
let greetingText = "Hello, \(calculation)"

// TODO: - Declare a constant Array of Strings containing some movies you like. Then use the for-in loop to iterate through them and print them to the console. Then i) print the length of the array of movies; and ii) print the second movie in the array.
let movies = ["The Batman", "James Bond", "Spiderman"]
for movie in movies {
    print(movie)
    print(movies.count)
    print(movies[1])
}

// TODO: - Declare two empty Int arrays. Loop through the numbers 0-100.. if a number is divisible by 3, add it to the first array. And if it is divisible by 5, add it to the other array. Otherwise, do nothing. (Hint: Use the modulus operator: %.)
var arrayOne: [Int] = []
var arrayTwo: [Int] = []

for number in 0 ... 100 {
    if number % 3 == 0 {
        arrayOne.append(number)
    }
    if number % 5 == 0 {
        arrayTwo.append(number)
    }
}

// TODO: - Change optionalName to nil. What greeting do you get? Add an else clause that sets a different greeting if optionalName is nil.
// returned: Well hello there!

let greeting = "Well hello there"
// var optionalName: String? = "Bob Vance"
var optionalName: String? = nil

if let name = optionalName {
    print("\(greeting) \(name)!")
}
else {
    print("\(greeting)!")
}

// TODO: - Declare a constant dictionary [String:Int] of restaurants where you frequently eat and the rating you give them on a scale of 1-10.
let restaurants: [String:Int] = ["Notos": 8, "Dewies": 7, "Napoli 3": 8]

// TODO: - Write one if let statement checking for the presence of a value in your restaurant dictionary. If it exists, print it out. Then write another if let which checks for the presence of multiple values in your dictionary. If they exist, print them out.
if let restaurantValueExists = restaurants["Notos"] {
    print(restaurantValueExists)
}

if let valueExists = restaurants["Notos"], let anotherValueExists = restaurants["Dewies"] {
    print(valueExists)
    print(anotherValueExists)
}
