import Foundation

/**
 // EXERCISE: - Making a GET call to https://pokeapi.co/api/v2/pokemon?offset=0&limit=5
 -
 */

/**
 // TODO: - Create a `URLRequest` and set method/headers
 -
 */

/**
 // TODO: - Create the `URLSession` and the `URLSessionDataTask` to perform the service call
 -
 */

/**
 // TODO: - Parse the response from `URLSessionDataTask` and print something meaningful to the console
 -
 - Check for errors
 - Check whether or not the response *can* be parsed (// HINT: - Cast `response` as a `HTTPURLResponse`)
 - Check that the response code is in the success range (200s)
 - Check that data exists
 - Use `JSONSerialization` to create a `jsonObject` from `data` and print it to console
 - Be sure to call `exit(0)` when the service call is complete
 */

/**
 // TODO: - Start the `task` and tell the `session` to invalidate when finished
 -
 */

/**
 // TODO: - Wrap the above code into a method that completes with a `Result` type in an escaping closure
 -
 - Give the method the signature `func get(from url: URL, completion: @escaping (Result<Data, ServiceCallError>) -> ())`
 - Inject calls to `completion` with the correct result cases where appropriate
 */

/**
 // TODO: - Call the above-written method and handle the result returned
 -
 - Switch over the result to handle its outcome
 - For `failure` case; `print` the `Error` to console
 - For `success` case: use `JSONSerialization` to create a `jsonObject` from `data` and print it to console
 - Be sure to call `exit(0)` when the service call is complete
 */

/**
 - This function:
 -- "Parks" the main thread and waits for blocks to be submitted
 -- Never returns (literally: `public func dispatchMain() -> Never`)
 -- Will allow us to make asynchronous service calls and handle program termination manually
 -
 - Generally, CLIs will utilize this method, or `CFRunLoopRun()` to accomplish asynchronous tasks
 */
dispatchMain()
