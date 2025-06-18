import Foundation

// TODO: - Write a method that iterates over the classRoster and attempts to unwrap a call to attendanceResponse in a  guard statement. If a response is received; print it, otherwise continue on to the next student in the roster.

let classRoster = ["Abagnale, Frank", "Abbey, Edward", "Abel, Reuben", "Abelson, Hal", "Abourezk, James", "Abrams, Creighton", "Ace, Jane", "Beard, Charles A.", "Beaumont and Fletcher", "Beck, Glenn", "Cherryh, C. J.", "Chesterton, Gilbert Keith", "Chevalier, Maurice", "Chiariglione, Leonardo"]

func attendanceResponse() -> String? {
    return ["Here!", "Present", nil, "Yup"].randomElement() ?? nil
}

// TODO: - Change the Invoice struct so that the amount property has the default value dollarAmount (amount: Double = dollarAmount). What happens? Why?

private let dollarAmount = 35.0
struct Invoice {
    let id: String = UUID().uuidString
    let date = Date()

    var amount: Double
}

// TODO: - Add a static property to Invoice salesTax. Give it a value of your choosing.

// TODO: - In a do-catch block; try performing a writeTest(). If the operation succeeds, inspect the resulting file (in finder). If not, print the error.
struct EncodingError: Error {}

func writeTest() throws {
    let testText = "Hello World!"
    
    guard let data = testText.data(using: .utf8) else { throw EncodingError() }
    
    try data.write(to: Bundle.main.bundleURL.appendingPathComponent("test.txt"))
    print(Bundle.main.bundleURL)
}
