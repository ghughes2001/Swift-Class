import class UIKit.UIImage

/// Convenience `enum` providing a data set to be used by the `UITableView` in `ViewController.swift`
enum AstrologicalSign: String, CaseIterable {
    case aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittarius, capricorn, aquarius, pisces
    
    /// Text for intended use by UI
    var displayName: String { "\(rawValue.first?.uppercased() ?? "")\(rawValue.dropFirst())" }
    
    /// A `UIImage` corresponding to a specific `AstrologicalSign` case
    var image: UIImage? { UIImage(named: rawValue) }
    
    /// A short description of a specific `AstrologicalSign` case, for intended use by UI
    var description: String {
        switch self {
        case .aries: return "The Ram"
        case .taurus: return "The Bull"
        case .gemini: return "The Twins"
        case .cancer: return "The Crab"
        case .leo: return "The Lion"
        case .virgo: return "The Maiden"
        case .libra: return "The Scales"
        case .scorpio: return "The Scorpion"
        case .sagittarius: return "The Archer"
        case .capricorn: return "The Goat-fish"
        case .aquarius: return "The Water-bearer"
        case .pisces: return "The Fishes"
        }
    }
}
