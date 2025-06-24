import class UIKit.UIColor

/// Convenience `enum` for completing tasks outlined in `TODO` comments
enum RainbowColor: String, CaseIterable {
    case red, orange, yellow, green, blue, purple
    
    /// A `UIColor` corresponding to a specific `RainbowColor` case
    var uiColor: UIColor {
        switch self {
        case .red: return .red
        case .orange: return .orange
        case .yellow: return .yellow
        case .green: return .green
        case .blue: return .blue
        case .purple: return .purple
        }
    }
}

protocol ModelDelegate: class {
    /**
     // TODO: - Declare methods here that meet the following criteria
     -
     - Update some text
     - Update some color
     // HINT: - Use the `RainbowColor` enum provided for the 2nd criterion
     -
     */
}

final class Model {
    private static let noColorUpdatesText: String = "No color updates took place"
    
    private(set) var updatesText: String = Model.noColorUpdatesText
    /**
     // TODO: - Declare a `ModelDelegate` here, name it `delegate`
     -
     */
    
    /**
     // TODO: - Write an initializer that takes a `ModelDelegate` as a paramter here
     -
     */
    
    func doSomething() {
        /**
         // TODO: - Write a method that makes some decision concerning a `RainbowColor` and notifies the delegate
         -
         */
    }
}
