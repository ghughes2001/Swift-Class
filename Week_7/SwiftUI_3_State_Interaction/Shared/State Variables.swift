import SwiftUI

struct StateVariableExample: View {
    @State var tapCount: Int = 0

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}
