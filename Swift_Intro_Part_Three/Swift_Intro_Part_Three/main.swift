import Foundation

// TODO: - Remove the day parameter and add a parameter to include today’s lunch special in the greeting

func greet(person: String, day: String) {
    print("Hello \(person), today is \(day).")
}
greet(person: "Bob", day: "Tuesday")

// TODO: - Write a variable that can store the function greet from above. Then call the function using the variable's name.

// TODO: - Now assign the function greetPolitely to the same variable and call it

func greetPolitely(name: String, day: String) -> () {
    print("Hello \(name), it's a pleasure to meet you.")
}

// TODO: - Write a constant to store the function doSomething. Then call the function using the constant's name

func doSomething() {
    print("I'm doing something!")
}

// TODO: - Finish the predicate function (sortMoviesByRatingDescending) to sort these movies by rating in descending order (best to last)

struct Movie {
    let title: String
    let rating: Int
}

let movies = [
    Movie(title: "47 Meters Down", rating: 53),
    Movie(title: "The House", rating: 30),
    Movie(title: "War on the Planet of the Apes", rating: 77),
    Movie(title: "Transformers: The Last Night", rating: 28)
]

func sortMoviesByRatingDescending(leftSide: Movie, rightSide: Movie) -> Bool {
    return leftSide.rating > rightSide.rating
}

let result = movies.sorted(by: sortMoviesByRatingDescending)
print(result)

// TODO: - Implement the sorting logic however you'd like to sort the numbers array below on your own using a closure
// HINT: - Xcode autocompletes the `sorted` closure, hit enter and then you can just fill in the placeholder values
let numbers = [70, 5, 1, 3, 0, -5, 25, 500, 100, 14]

// TODO: - Use forEach and print out each number in numbers that is divisible by 15

// TODO: - Map over the numbers array to multiply each element by a factor of 100 and print the resulting array

// TODO: - Filter the numbers array to only return numbers that are greater than 50 and print the resulting array
