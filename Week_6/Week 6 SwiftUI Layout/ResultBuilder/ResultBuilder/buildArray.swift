import Foundation

func learnAboutBuildArray() {
    // MARK: Problem 1 --------------------------------------------------------
    @resultBuilder
    struct LoopBuilder {
        static func buildBlock(_ parts: String...) -> String {
            parts.joined(separator: "\n")
        }

        static func buildArray(_ components: [String]) -> String {
            components.joined(separator: "\n")
        }
    }
    
    // TODO: Add another component to the function which makes it print up to 10 instead of 6.
    @LoopBuilder func example1() -> String {
        "0"
        for x in 1...5 { // 5 calls to buildBlock
            String(x)
						"-"
        } // buildArray to finalize all statements in the Block
        "6"
    } // 1 call to finalize the block
    
    print("Problem 1:", example1(), separator: "\n")
}
