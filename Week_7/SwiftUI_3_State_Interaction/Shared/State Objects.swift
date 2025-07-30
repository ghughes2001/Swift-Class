import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var clicks: Int = 0
}

struct StateObjectExample: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        Button("Tap count: \(viewModel.clicks)") {
            viewModel.clicks += 1
        }.tint(Color.red)
    }
}
