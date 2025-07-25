import Foundation

/// `@resultBuilder` is an attribute for structs.
/// A function ends with "components" (many statements).
/// `buildBlock` operates on those components to create a single return value.
func learnAboutBuildBlock() {
    // MARK: Problem 1 -----------------------------------------------------------------------------
    
    @resultBuilder
    struct MultiStringBuilder {              //    ... variadic function
        static func buildBlock(_ components: String...) -> String {
					// ["Mike", "A", "B"].joined() => "MikeAB"
            return components.joined()
        }
    }
    
    // TODO: Declare a String variable to this function's body, and reference it in the components.
    // TODO: Try inserting newlines between the components. Did the return value change?
    // TODO: Try inserting non-String data in the middle of the components. What does the error mean?
    @MultiStringBuilder func someFuncEndingInManyStrings() -> String {
        var name = "Mike"
        name
        
        
        "A"
			  "B"
    }
    
    print("Problem 1:", someFuncEndingInManyStrings())
    
    
    // MARK: Problem 2 -----------------------------------------------------------------------------
    
    
    @resultBuilder
    struct TakeInts {
        static func buildBlock(_ components: Any...) -> [Int] {
            components.filter { component in
                return component is Int
            } as! [Int]
        }
    }
    
    // TODO: Implement a function which uses the TakeInts attribute. Define it to return the components: "1", 1, "2", 2, "3", 4
    
    print("Problem 2:")
    @TakeInts func someFunc() -> [Int] {
        "0"
        2
        "1"
        6
        "3"
        4
    }
    print(someFunc())
    
    // MARK: -----------------------------------------------------------------------------------------
    
    // TODO: Implement a new @resultBuilder which takes String components, and returns an [Int]. Attempt to convert the components into Ints, and return an array of the data that successfully converted to Ints.
    // TODO: Implement a function which calls this @resultBuilder.
    print("Problem 3:")
    
    @resultBuilder struct ParsingBuilder {
        static func buildBlock(_ components: String...) -> [Float] {
            components.compactMap { str in
                return Float(str)
            }
        }
    }
    
    @ParsingBuilder func problem3() -> [Float] {
        "33"
        "-100"
        "NAN"
        "INF"
    }
    print(problem3())
}
