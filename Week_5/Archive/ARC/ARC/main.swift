import Foundation

/**
 // TODO: - Before completing the following; inspect the `Person` class by `option-click`-ing a `Person` object below
 -
 */

/**
 // NOTE: - Strong references can be optional
 -
 */

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "Jon Snow")
reference2 = reference1
reference3 = reference2

/**
 // TODO: - Uncomment the following lines one-at-a-time (pressing `cmd + R` in between) to see the when the objects are deallocated
 -
 */

//reference1 = nil
//reference2 = nil
//reference3 = nil

//------------------------------------------------------------

/**
 // NOTE: - Weak references do NOT increment retain count and must be Optional
 -
 */

/**
 // TODO: - Remove the `?` from `weak var weakRef: Person?` and note the compiler's reaction (put it back when you are done)
 -
 */

var strongRef: Person?
weak var weakRef: Person?

/**
 // TODO: - Uncomment the following lines one-at-a-time (pressing `cmd + R` in between) to see the when the objects are deallocated
 -
 */

//weakRef = Person(name: "Tyrion Lannister")
//
//strongRef = Person(name: "Tyrion Lannister")
//weakRef = strongRef
//strongRef = nil

//------------------------------------------------------------

/**
 // NOTE: - Weak references do NOT increment retain count and must be Optional
 -
 */

var jon: Person? = Person(name: "Jon Snow")
var tyrion: Person? = Person(name: "Tyrion Lannister")

jon?.friend = tyrion
tyrion?.friend = jon

/**
// TODO: - Uncomment the following lines and press `cmd + R`
-
*/

//tyrion = nil
//jon = nil

/**
 // NOTE: -
 -
 This didn't work like we might've expected. And now we don't have a reference to either of those objects. They're still allocated but lost to us forever!
 -
 We would have to first get rid of the friend references, and then `nil` out the main references
 -
 */

/**
// TODO: - Recomment out the above lines, uncomment the following lines and press `cmd + R`
-
*/

//jon?.friend = nil
//tyrion?.friend = nil
//tyrion = nil
//jon = nil
