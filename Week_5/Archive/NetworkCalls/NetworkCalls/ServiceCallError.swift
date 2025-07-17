/**
 Object conforming to the `Error` `protocol`
 
 Used to interpret unsuccessful service calls
 */
struct ServiceCallError: Error {
    /// A meaningful message detailing the error's root cause
    let message: String
    /// The error's accompanying `HTTPStatusCode`, if one was returned from service
    let code: Int?
    
    init(message: String, code: Int?) {
        self.message = message
        self.code = code
    }
}
