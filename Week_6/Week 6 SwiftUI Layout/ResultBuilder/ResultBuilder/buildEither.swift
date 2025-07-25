import Foundation

/// `buildEither` enables `if/else` statements in the component list
func learnAboutBuildEither() {
    // MARK: Problem 1 --------------------------------------------------------
    @resultBuilder
    struct ConditionalStringBuilder {
        static func buildBlock(_ parts: String...) -> String {
            parts.joined()
        }
        
        static func buildEither(first component: String) -> String {
            return component
        }
        
        static func buildEither(second component: String) -> String {
            return component
        }
    }
    
    // TODO: Make this print "The quick brown fox jumped over the HAPPY dog."
    @ConditionalStringBuilder func example1() -> String {
        "The quick brown fox "
        "jumped over the "
        
        if true {
            "lazy "
        } else {
            "happy "
        }
        
        "dog."
    }
    
    print("Problem 1:", example1())
}
